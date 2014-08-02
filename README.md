# Listing

* seapy/ruby
  * ruby, bundler, git, curl, wget
* seapy/rails
  * unicorn, nginx, foreman

# Add your project

## Dockerfile

```
FROM seapy/rails
MAINTAINER seapy(iamseapy@gmail.com)

EXPOSE 80
CMD bundle exec rake assets:precompile && foreman start -f Procfile -c web=1,nginx=1
```

## Procfile

```
web: bundle exec unicorn -c config/container/unicorn.rb
nginx: /usr/sbin/nginx -c /etc/nginx/nginx.conf
```

## Unicorn

```
# config/container/unicorn.rb
app_dir = "/app"
 
working_directory app_dir
 
pid "#{app_dir}/tmp/pids/unicorn.pid"
 
stderr_path "#{app_dir}/log/unicorn.stderr.log"
stdout_path "#{app_dir}/log/unicorn.stdout.log"
 
worker_processes 1
listen "/tmp/unicorn.sock", :backlog => 64
timeout 30
```

## Nginx

```
# config/container/nginx-sites.conf
upstream unicorn_server {
  server unix:/tmp/unicorn.sock fail_timeout=0;
}

server {
  listen 80;

  root /app/public;
  try_files $uri @unicorn_server;

  location @unicorn_server {
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    proxy_set_header Host $http_host;
    #proxy_set_header X-Forwarded-Proto https; # if use ssl
    proxy_redirect off;
    proxy_pass http://unicorn_server;
  }

  location ~ ^/(assets|images|javascripts|stylesheets|swfs|system)/ {
    gzip_static on;
    expires max;
    add_header Cache-Control public;
    add_header Last-Modified "";
    add_header ETag "";

    open_file_cache max=1000 inactive=500s;
    open_file_cache_valid 600s;
    open_file_cache_errors on;
    break;
  }
}
```

# Quotation

* https://github.com/rodrigosaito/rack_unicorn_docker/blob/master/Dockerfile
* https://github.com/rodrigosaito/docker_ruby/blob/master/Dockerfile
* https://github.com/tianon/dockerfiles/blob/master/ruby-unicorn/Dockerfile
* https://github.com/tianon/dockerfiles/blob/master/ruby-unicorn-nginx/Dockerfile
* https://github.com/litaio/dockerfiles/blob/master/ruby/Dockerfile
* https://github.com/abevoelker/docker-ruby/blob/master/Dockerfile
