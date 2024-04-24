# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: vgroux <vgroux@student.42lausanne.ch>      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/02/16 14:12:05 by vgroux            #+#    #+#              #
#    Updated: 2024/04/23 15:11:23 by vgroux           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

DOCKER = docker-compose -f ./srcs/docker-compose.yml
DATA_FOLDER = /home/vgroux/data

all:
	clear
	mkdir -p /home/vgroux/data/mariadb
	mkdir -p /home/vgroux/data/wordpress
	$(DOCKER) up -d --build

down:
	clear
	${DOCKER} down

debug: all
	${DOCKER} logs -f

look:
	docker ps -a
	@echo ''
	docker image ls -a
	@echo ''
	docker volume ls
	@echo ''
	docker network ls

clean:
	clear
	$(DOCKER) down
	docker image prune -a

fclean: clean
	docker volume rm srcs_wordpress --force
	docker volume rm srcs_mariadb --force
	docker system prune -a --volumes
	sudo rm -rf ~/data/wordpress
	sudo rm -rf ~/data/mariadb

re : fclean all

.PHONY: all re fclean debug clean look