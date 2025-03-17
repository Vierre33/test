CXX			=	g++

CXXFLAGS	+=  -Wall -Wextra -Werror

CPPFLAGS	+=	-iquote include

SRC			:=	Main

SRC			:=	$(addsuffix .cpp, $(SRC))

OBJ			:=	$(SRC:.cpp=.o)

NAME		=	arcade


RM			?=	rm -f

VALGRIND	=	valgrind --leak-check=full


all:	$(NAME)

$(NAME):	$(OBJ)
	-$(CXX) -o $(NAME) $(OBJ)

clean:
	@$(RM) $(OBJ)

fclean:
	@$(RM) $(OBJ) $(NAME)

re:	fclean all

run:	all
	@./$(NAME) $(args)

debug: 	CXXFLAGS += -g
debug:	re
	@$(VALGRIND) ./$(NAME) $(args)

tests_run:
	@$(RM)


.PHONY: all clean fclean re run debug
