# -*- coding: utf-8 -*-
FLAGS	= --no-deps --build
TARGET	= ./srcs/docker-compose.yml
SILENT	= > /dev/null 2>&1
NOERR	= | true
IDC	= $(SILENT) $(NOERR)

BLUE	= \033[1;34m
RESET	= \033[0m
URL	= chajjar.42.fr


a: all
all: addhost build

h: addhost
addhost:
	@chmod 777 /etc/hosts
	@echo "127.0.0.1 $(URL)" >> /etc/hosts
	@echo "127.0.0.1 www.$(URL)" >> /etc/hosts

r: run
run:
	@printf "$(BLUE)██████████████████████ Building Images ███████████████████████$(RESET)"
	@docker-compose -f $(TARGET) up

c: clean
clean:
	@docker-compose -f $(TARGET) down

fc: fclean
fclean: clean
	@docker rm -f $(shell docker ps -aq) $(IDC)
	@docker rmi -f $(shell docker images -aq) $(IDC)

b: build
build: clean
	@docker-compose -f $(TARGET) up $(FLAGS)

k: kill
kill:
	@kill -9 $(shell lsof -t -i tcp:80) $(IDC)

re: remake
remake: fclean kill build

.PHONY: all build clear fclean kill remake
