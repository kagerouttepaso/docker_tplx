FROM ubuntu:12.04
MAINTAINER yuki kitsunai <goth.wasawasa@gmail.com>

#RUN apt-get update
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y curl
RUN curl -L https://www.chef.io/chef/install.sh -o /tmp/install.sh
RUN bash /tmp/install.sh
RUN rm /tmp/install.sh

ADD ./cookbooks /opt/chef/cookbooks
RUN /opt/chef/bin/chef-apply /opt/chef/cookbooks/my_settings.rb

RUN /opt/chef/bin/chef-apply /opt/chef/cookbooks/tplx.rb
