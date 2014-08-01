FROM seapy/ruby:2.1.2
MAINTAINER ChangHoon Jeong <iamseapy@gmail.com>

# Install nodejs
RUN apt-get install -qq -y nodejs

# Install foreman
RUN gem install foreman

# Install the latest postgresql lib for pg gem
RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main" > /etc/apt/sources.list.d/pgdg.list && \
    apt-get update && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get install -y --force-yes libpq-dev

# SSH config for bitbucket.org
RUN mkdir /root/.ssh/
ONBUILD ADD id_rsa /root/.ssh/id_rsa
ONBUILD RUN touch /root/.ssh/known_hosts
ONBUILD RUN ssh-keyscan -t rsa bitbucket.org >> /root/.ssh/known_hosts

# Install Rails App
WORKDIR /app
ONBUILD ADD Gemfile /app/Gemfile
ONBUILD ADD Gemfile.lock /app/Gemfile.lock
ONBUILD RUN bundle install --without development test
ONBUILD ADD . /app

ENV RAILS_ENV production