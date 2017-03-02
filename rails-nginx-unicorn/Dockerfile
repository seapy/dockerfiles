FROM ruby:2.2.2
MAINTAINER ChangHoon Jeong <iamseapy@gmail.com>

RUN apt-get update -qq && apt-get install -y build-essential

# Install Nginx.
RUN add-apt-repository -y ppa:nginx/stable
RUN apt-get update
RUN apt-get install -qq -y nginx=1.8.0-1+trusty1
RUN echo "\ndaemon off;" >> /etc/nginx/nginx.conf
RUN chown -R www-data:www-data /var/lib/nginx
# Add default nginx config
ADD nginx-sites.conf /etc/nginx/sites-enabled/default

# Install foreman
RUN gem install foreman

# Install Rails App
WORKDIR /app
ONBUILD ADD Gemfile /app/Gemfile
ONBUILD ADD Gemfile.lock /app/Gemfile.lock
ONBUILD RUN bundle install
ONBUILD ADD . /app

# Add default unicorn config
ADD unicorn.rb /app/config/unicorn.rb

# Add default foreman config
ADD Procfile /app/Procfile

CMD foreman start -f Procfile
