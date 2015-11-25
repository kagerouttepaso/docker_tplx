FROM ubuntu:12.04
MAINTAINER yuki kitsunai <goth.wasawasa@gmail.com>

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y curl

#Run chef
ADD ./cookbooks /opt/chef/cookbooks
RUN curl -L https://www.chef.io/chef/install.sh -o /tmp/install.sh  && \
    bash /tmp/install.sh                                            && \
    rm /tmp/install.sh                                              && \
    /opt/chef/bin/chef-apply /opt/chef/cookbooks/my_settings.rb     && \
    /opt/chef/bin/chef-apply /opt/chef/cookbooks/tplx.rb            && \
    rm -rf /opt/chef



ADD ./build_script /opt/build_script
ADD ./scripts /opt/scripts
ENTRYPOINT ["/opt/scripts/startup.sh"]
CMD ["help"]
