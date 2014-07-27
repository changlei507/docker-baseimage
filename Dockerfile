FROM phusion/baseimage:0.9.12

MAINTAINER Mathias Hertlein

CMD ["/sbin/my_init"]

ENV HOME /root
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get dist-upgrade -y --no-install-recommends && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD etc /etc

RUN chmod +x /etc/my_init.d/first_boot && \
    touch /var/run/first_boot
