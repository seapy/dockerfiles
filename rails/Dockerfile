FROM seapy/ruby
MAINTAINER ChangHoon Jeong <iamseapy@gmail.com>

# Install the latest postgresql lib for pg gem
RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main" > /etc/apt/sources.list.d/pgdg.list && \
    apt-get update && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get install -y --force-yes libpq-dev

RUN apt-get update

# Install nodejs
RUN apt-get install -qq -y nodejs

# Install foreman
RUN gem install foreman

WORKDIR /app

# Source ADD
ONBUILD ADD Gemfile /app/Gemfile
ONBUILD ADD Gemfile.lock /app/Gemfile.lock
ONBUILD RUN bundle install --without development test
ONBUILD ADD . /app

# SSH config
RUN mkdir ~/.ssh/
ONBUILD ADD id_rsa ~/.ssh/id_rsa
ONBUILD RUN touch ~/.ssh/known_hosts
ONBUILD RUN ssh-keyscan -t rsa bitbucket.org >> ~/.ssh/known_hosts

ENV RAILS_ENV production