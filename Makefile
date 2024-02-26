# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: vgroux <vgroux@student.42lausanne.ch>      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/02/16 14:12:05 by vgroux            #+#    #+#              #
#    Updated: 2024/02/26 13:46:32 by vgroux           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

DOCKER = docker-compose -f ./srcs/docker-compose.yml
DATA_FOLDER = /home/vgroux/data

all:
	clear
	mkdir -p /home/vgroux/data/mariadb
	mkdir -p /home/vgroux/data/wordpress
	$(DOCKER) up -d --build

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
	docker image prune -a
	$(DOCKER) down

fclean: clean
	docker system prune -a --volumes
	docker volume rm srcs_mariadb
	docker volume rm srcs_wordpress
	rm -rf ~/data/mariadb
	rm -rf ~/data/wordpress


re : fclean all

.PHONY: all re fclean debug clean look