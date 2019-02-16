# Nginx Php-fpm

`base: php:7.3.2-fpm-stretch`

ditambai supervisor

pull
`
docker pull rizoa/docker-phpnginx:lastest
`

run:
`
docker run --rm -ti --name 'ngingkong' -p 3000:80 rizoa/docker-phpnginx:lastest
`
