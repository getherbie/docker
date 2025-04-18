# Docker

Simple Docker image for Herbie CMS using PHP's built-in web server.

## Create Image

Create docker image

    docker build -t herbie https://github.com/getherbie/docker.git

You can use different PHP versions, too

    PHP_VERSION=8.0 docker build -t herbie:php8.0 https://github.com/getherbie/docker.git

## Website Starter

Create new website und install packages

    docker run --rm -it -v .:/app herbie composer create-project getherbie/start-website mywebsite

Change directory

    cd mywebsite

Run website

    docker run --rm -v .:/app -p 8888:8888 herbie

## Development Environment

Clone project

    git clone https://github.com/getherbie/herbie.git

Change directory

    cd herbie

Install packages

    docker run --rm -it -v .:/app herbie composer install

Run tests

    docker run --rm -it -v .:/app herbie composer test

Run bash shell

    docker run --rm -it -v .:/app herbie bash
