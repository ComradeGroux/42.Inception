# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: vgroux <vgroux@student.42lausanne.ch>      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/01/24 13:08:50 by vgroux            #+#    #+#              #
#    Updated: 2024/01/30 17:15:31 by vgroux           ###   ########.fr        #
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

clean:
	docker image prune -a
	docker-compose -f ./srcs/docker-compose.yml down

fclean: clean
	docker system prune -a --volumes

vol:
	docker volume rm $$(docker volume ls)

re: fclean
	docker-compose -f ./srcs/docker-compose.yml up -d --build
	
.PHONY: all down re clean fclean vol debug look