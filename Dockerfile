FROM php:7.3.2-fpm-stretch

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN apt update -y && apt install supervisor -y

#RUN pecl install mongodb -y && echo 'extension=mongodb.so' > /usr/local/etc/php/php.ini
RUN apt install nginx -y

WORKDIR /home
COPY ./webapp /home
RUN chmod 777 /home -R

# Configure nginx
COPY config/nginx.conf /etc/nginx/nginx.conf
COPY config/default.conf /etc/nginx/conf.d/default.conf

# Configure PHP-FPM
COPY config/fpm-www.conf /usr/local/etc/php-fpm.d/www.conf

# Configure SUpervisord
COPY config/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

EXPOSE 80
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]