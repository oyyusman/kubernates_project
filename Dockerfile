FROM php:7.4-apache

WORKDIR /var/www/html

COPY  php/ /var/www/html/

RUN docker-php-ext-install pdo pdo_mysql

EXPOSE 80

ENV MYSQL_ROOT_PASSWORD=1234
ENV MYSQL_DATABASE=bluebird
ENV MYSQL_USER=ubuntu
ENV MYSQL_PASSWORD=1234

RUN apt-get update && apt-get install -y default-mysql-client
# copy the sql file from current directory to mysql
COPY bluebirdhotel.sql /docker-entrypoint-initdb.d/

CMD ["apache2-foreground"]
