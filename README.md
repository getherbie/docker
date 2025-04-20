# Docker Image for Herbie CMS

Minimal Docker image for Herbie CMS using PHP's built-in web server.

## Supported PHP Versions

8.0 / 8.1 / 8.2 / 8.3 (latest)

## Build Docker Image

Create Docker image based on the latest supported PHP version

    docker build -t herbie https://github.com/getherbie/docker.git

Optionally you can also use an older PHP version

    docker build --build-arg PHP_VERSION=8.0 -t herbie https://github.com/getherbie/docker.git
    docker build --build-arg PHP_VERSION=8.1 -t herbie https://github.com/getherbie/docker.git
    docker build --build-arg PHP_VERSION=8.2 -t herbie https://github.com/getherbie/docker.git

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

Run website

    docker run --rm -v .:/app -p 8888:8888 herbie php -S 0.0.0.0:8888 -t /app/website/web

Run tests

    docker run --rm -it -v .:/app herbie composer test

Run test website

    docker run --rm -v .:/app -p 8888:8888 herbie php -S 0.0.0.0:8888 -t /app/tests/_data/web

Run bash shell

    docker run --rm -it -v .:/app herbie bash

### Step Debugging

In Visual Studio Code, install the extension `xdebug.php-debug` and add the following configuration to `.vscode/launch.json`

    {
        "version": "0.2.0",
        "configurations": [
            {
                "name": "Docker Xdebug",
                "type": "php",
                "request": "launch",
                "port": 9003,
                "pathMappings": {
                    "/app/": "${workspaceRoot}/"
                }
            }
        ]
    }

Run website

    docker run --rm \
        -e XDEBUG_CONFIG="client_host=172.17.0.1" \
        -e XDEBUG_MODE=debug \
        -e XDEBUG_SESSION_START=true \
        -p 8888:8888 \
        -v .:/app \
        herbie php -S 0.0.0.0:8888 -t /app/website/web

Start debugging in Visual Studio Code
