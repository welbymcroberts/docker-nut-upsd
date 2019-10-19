FROM alpine:3.10

LABEL description="This image is used to start an instance of Network UPS Tools (NUT)" maintainer="Welby McRoberts <docker@whmcr.com>"

# Install NUT from apk
RUN apk --no-cache --repository http://dl.alpinelinux.org/alpine/edge/testing/ add nut

# Set nut to be a netserver, docker container is not useful without this mode
RUN sed -i 's/MODE=none/MODE=netserver/' /etc/nut/nut.conf

# Add Entrypoint to container
COPY entrypoint.sh /entrypoint.sh

# Run NUT UPSD + UPSDriver + UPSLog + UPSMon
ENTRYPOINT /entrypoint.sh
