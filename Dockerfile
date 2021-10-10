# FROM python:3.9-alpine
FROM python:3.9

ARG TARGETPLATFORM
ARG BUILDPLATFORM

RUN echo "I am running on $BUILDPLATFORM, building for $TARGETPLATFORM"

# https://docs.docker.com/buildx/working-with-buildx/#build-multi-platform-images
# BUILDPLATFORM and TARGETPLATFORM env var
# Note this url may have been updated. Find the latest by browsing http://ftp.us.debian.org/debian/pool/main/libs/libseccomp/
RUN if [ "$TARGETPLATFORM" = "linux/arm/v6" ] ; then wget -O /tmp/libseccomp2.deb http://ftp.us.debian.org/debian/pool/main/libs/libseccomp/libseccomp2_2.4.4-1~bpo10+1_armhf.deb && \
  dpkg -i libseccomp2_2.4.4-1~bpo10+1_armhf.deb && rm /tmp/libseccomp2.deb ; fi

WORKDIR /app

COPY ./requirements.txt .
RUN pip install --no-cache-dir -r ./requirements.txt
COPY ./wake_on_lan_mqtt_proxy.py .
# bind mount for config directory
# apps expect to find /app/config/config.yaml
RUN mkdir -p /app/config

CMD ["python", "wake_on_lan_mqtt_proxy.py"]