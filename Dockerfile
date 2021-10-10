# Couldn't get Alpine image working Docker 20.x on Raspberry Pi
# https://blog.samcater.com/fix-workaround-rpi4-docker-libseccomp2-docker-20/
FROM python:3.9-buster

# https://docs.docker.com/buildx/working-with-buildx/#build-multi-platform-images
# BUILDPLATFORM and TARGETPLATFORM env var
ARG TARGETPLATFORM
ARG BUILDPLATFORM

RUN echo "I am running on $BUILDPLATFORM, building for $TARGETPLATFORM"

WORKDIR /app

COPY ./requirements.txt .
RUN pip install --no-cache-dir -r ./requirements.txt
COPY ./wake_on_lan_mqtt_proxy.py .
# bind mount for config directory
# apps expect to find /app/config/config.yaml
RUN mkdir -p /app/config

CMD ["python", "wake_on_lan_mqtt_proxy.py"]