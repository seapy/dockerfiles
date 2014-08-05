# Rails(+ Nginx, Unicorn) Dockerfile

Easy useable docker for rails. less configuration, affordable production.

## What's include

* unicorn, nginx, foreman
* mysql, postgresql lib

# Usage

* Create `Dockerfile` to your project and paste below code.

```
# Dockerfile
FROM seapy/rails-nginx-unicorn
MAINTAINER seapy(iamseapy@gmail.com)

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

if your rails app required pre-install lib like imagemagick(or others) use [`rails-nginx-unicorn-pro`](https://github.com/seapy/dockerfiles/tree/master/rails-nginx-unicorn-pro)


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


# Use a specific version of Ruby, Nginx

Change `FROM` instruction your Dockerfile

```
# Dockerfile
FROM seapy/rails-nginx-unicorn:ruby2.1.2-nginx1.6.0
...
```


# TODO

* github connection setting(like bitbucket)
