# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mcatalan <mcatalan@student.42barcelona.    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/07/04 10:58:09 by mcatalan@st       #+#    #+#              #
#    Updated: 2023/10/02 13:19:21 by mcatalan         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

CC = gcc

NAME 	= 	prueba

SRCS		= 	src/main.c 

OBJ 		= 	$(SRCS:.c=.o)

MLX_DIR 	= includes/mlx/
MLX_LIB 	= $(MLX_DIR)libmlx.a
MLX_FLAGS 	= -Lincludes/mlx -lmlx -framework OpenGL -framework AppKit

CFLAGS  =  -Wall -Werror -Wextra

%.o: %.c
	$(CC) $(CFLAGS) -I $(HEADER) -MMD -Imlx -c $< -o $@


$(NAME):	$(OBJ)
	@$(CC) $(OBJ) -o $(NAME) $(MLX_FLAGS) $(MLX_LIB)

all:		subsystems$(NAME)

subsystems:
	@make -s -C $(MLX_DIR) 

clean:
			rm -f $(OBJ)

fclean:		clean
			rm -f $(NAME)

re:			all clean

.PHONY:		all bonus clean fclean re