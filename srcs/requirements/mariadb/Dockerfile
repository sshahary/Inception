# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sshahary <sshahary@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/09/03 12:00:52 by sshahary          #+#    #+#              #
#    Updated: 2024/09/05 13:25:58 by sshahary         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

RUN apt-get update && apt-get upgrade -y && \
	apt-get install -y mariadb-server mariadb-client && \
	rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/lib/mysql /var/run/mysqld && \
	chown -R mysql:mysql /var/lib/mysql /var/run/mysqld

COPY ./conf/99-server.cnf /etc/mysql/mariadb.conf.d/99-server.cnf


RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql

COPY ./tools/script.sh /usr/local/bin/startup.sh
RUN chmod +x /usr/local/bin/startup.sh

EXPOSE 3306

CMD [ "/usr/local/bin/startup.sh" ]