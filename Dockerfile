FROM phusion/baseimage
MAINTAINER Dawid Pytka <dpytka@gmail.com>

# Install system dependencies
RUN apt-add-repository ppa:brightbox/ruby-ng
RUN apt-get update && apt-get dist-upgrade -qq -y
RUN apt-get install -qq -y ruby-switch ruby2.1 \
  build-essential ruby2.1-dev libpq-dev \
  nodejs libsqlite3-dev
RUN ruby-switch --set ruby2.1

# Update Rubygems and install a couple of system-wide gems.
RUN gem update --system --no-rdoc --no-ri
RUN gem update --no-rdoc --no-ri
RUN gem install --no-rdoc --no-ri bundler

ADD . /webapp

RUN cd /webapp && bundle
RUN rm -r /webapp

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
