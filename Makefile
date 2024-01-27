# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: vgroux <vgroux@student.42lausanne.ch>      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/01/24 13:08:50 by vgroux            #+#    #+#              #
#    Updated: 2024/01/27 14:11:32 by vgroux           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all:
	docker-compose -f ./srcs/docker-compose.yml up -d --build

down:
	docker-compose -f ./srcs/docker-compose.yml down

debug: all
	docker-compose -f ./srcs/docker-compose.yml logs -f

look:
	docker ps -a
	@echo ''
	docker image ls -a
	@echo ''
	docker volume ls
	@echo ''
	docker network ls

stop:
	docker-compose -f ./srcs/docker-compose.yml down -v

re: clean
	docker-compose -f ./srcs/docker-compose.yml up -d --build

clean: down
	docker-compose -f ./srcs/docker-compose.yml down -v
	docker volume rm -f $$(docker volume ls)
	docker rmi -f $$(docker image ls -qa)
	docker rm -f $$(docker ps -qa)
	
.PHONY: all down re clean fclean