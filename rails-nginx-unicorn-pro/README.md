# Rails(+ Nginx, Unicorn) Dockerfile Pro

Easy useable docker for rails. more configuration, affordable production.

## What's include

* unicorn, nginx, foreman


# Usage

* Create `Dockerfile` to your project and paste below code.

```
# Dockerfile
FROM seapy/rails-nginx-unicorn-pro:v1.0-ruby2.2.0-nginx1.6.0
MAINTAINER seapy(iamseapy@gmail.com)

# Add here your preinstall lib(e.g. imagemagick, mysql lib, pg lib, ssh config)

#(required) Install Rails App
ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock
RUN bundle install --without development test
ADD . /app

#(required) nginx port number
EXPOSE 80
```

* Add `unicorn` gem(maybe uncomment `gem 'unicorn'` in `Gemfile`)

## Build and run docker

```
# build your dockerfile
$ docker build -t your/project .

# run container
$ docker run -d -p 80:80 -e SECRET_KEY_BASE=secretkey your/project
```

## Screencast

[Easy Ruby On Rails deploy on Docker](http://youtu.be/QgmzBuPuM6I)


# Custom pre-install lib

if your rails app required lib like imagemagick(or mysql) you must install that before `Install Rails App` section

## Install imagemagick

```
RUN apt-get udpate
RUN apt-get -qq -y install libmagickwand-dev imagemagick
```

## Install MySQL(for mysql, mysql2 gem)

```
RUN apt-get udpate
RUN apt-get install -qq -y mysql-server mysql-client libmysqlclient-dev
```

## Install PostgreSQL lib(for pg gem)

```
RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main" > /etc/apt/sources.list.d/pgdg.list && \
    apt-get update && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get install -y --force-yes libpq-dev
```

## Access bitbucket private repository

```
RUN mkdir /root/.ssh/
ADD id_rsa /root/.ssh/id_rsa
RUN touch /root/.ssh/known_hosts
RUN ssh-keyscan -t rsa bitbucket.org >> /root/.ssh/known_hosts
```

Copy your `~/.ssh/id_rsa` to `id_rsa` for bitbucket connection. if you don't need to bitbucket connection, create blank `id_rsa`. don't forget add `id_rsa` to `.gitignore`


# Customize Nginx, Unicorn, foreman config

## Nginx

```
# your Dockerfile
...
ADD config/your-custom-nginx.conf /etc/nginx/sites-enabled/default
...
```

## Unicorn

place your unicorn config to `config/unicorn.rb`

## foreman

place your Procfile to app root

