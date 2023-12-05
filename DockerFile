# Use a base image that supports systemd, for example, ubuntu
FROM ubuntu: 20.04

#Install necessary packages
Run apt-get update && \
    apt-get install -y shellinabox && \
    apt-get install -y systemd && \
    apt-get clean systemd && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN echo 'root:root' | chpasswd
#Expose the web-based terminal port
EXPOSE 4200

#Start shellinabox
CMD ["/usr/bin/shellinabox", "-t", "-s", "/:LOGIN"]
