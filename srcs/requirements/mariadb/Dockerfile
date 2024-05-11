# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tmejri <tmejri@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/01/26 16:01:45 by tmejri            #+#    #+#              #
#    Updated: 2024/01/26 16:01:55 by tmejri           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	debian:bullseye

EXPOSE	3306

RUN		apt-get update -y \
        && apt-get upgrade -y \
        && apt-get install mariadb-server -y

RUN     mkdir -p /run/mysqld && chown mysql:root /run/mysqld

COPY	conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY	./tools/mdb_script.sh /etc/mdb_script.sh

RUN		chmod +x /etc/mdb_script.sh


CMD		["sh", "/etc/mdb_script.sh"]