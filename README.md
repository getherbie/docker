# Docker

Simple Docker image for Herbie CMS using PHP's built-in web server.

## Howto

Create image

    docker build -t herbie https://github.com/getherbie/docker.git

Run website

    docker run --rm -v $(pwd):/app -p 8888:8888 herbie
    docker run --rm -v $(pwd):/app -p 8888:8888 herbie

Install packages

    docker run --rm -it -v $(pwd):/app herbie composer install

Run tests

    docker run --rm -it -v $(pwd):/app herbie composer test

Run bash shell

    docker run --rm -it -v $(pwd):/app herbie bash
