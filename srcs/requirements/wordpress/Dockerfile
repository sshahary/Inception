# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sshahary <sshahary@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/09/03 15:36:40 by sshahary          #+#    #+#              #
#    Updated: 2024/09/05 13:29:25 by sshahary         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

RUN apt update && apt install -y php-fpm php-mysql curl && rm -rf /var/lib/apt/lists/*

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp

RUN sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/g' /etc/php/7.3/fpm/pool.d/www.conf && \
	mkdir -p /run/php /var/www /var/log/php

COPY ./tools/script.sh /usr/local/bin/wordpress_setup.sh
RUN chmod +x /usr/local/bin/wordpress_setup.sh

EXPOSE 9000

CMD [ "/usr/local/bin/wordpress_setup.sh" ]
