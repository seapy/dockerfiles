# Rails(+ Nginx, Unicorn) Dockerfile

Easy useable docker for rails. less configuration, affordable production.

## What's include

* unicorn, nginx, foreman


# Usage

* Create `Dockerfile` to your project and paste below code.

```
# Dockerfile
FROM seapy/rails-nginx-unicorn
MAINTAINER seapy(iamseapy@gmail.com)

EXPOSE 80
```

* Add `unicorn` gem(maybe uncomment `gem 'unicorn'` in `Gemfile`)
* Copy your `~/.ssh/id_rsa` to `id_rsa` for bitbucket connection. if you don't need to bitbucket connection, create blank `id_rsa`. don't forget add `id_rsa` to `.gitignore`

## Build and run docker

```
# build your dockerfile
$ docker build -t your/project .

# run container
$ docker run -d -p 80:80 your/project
```

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
* screencast
