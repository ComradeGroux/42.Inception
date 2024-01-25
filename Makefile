# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: vgroux <vgroux@student.42lausanne.ch>      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/01/24 13:08:50 by vgroux            #+#    #+#              #
#    Updated: 2024/01/25 11:55:30 by vgroux           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all:
	docker-compose -f ./srcs/docker-compose.yml up -d --build

down:
	docker-compose -f ./srcs/docker-compose.yml down

debug: all
	docker-compose -f ./srcs/docker-compose.yml logs -f

re:
	docker-compose -f ./srcs/docker-compose.yml up -d --build

clean:
	docker-compose -f ./srcs/docker-compose.yml down -v; \
	docker rmi -f $$(docker image ls -qa);
	
.PHONY: all down re clean fclean