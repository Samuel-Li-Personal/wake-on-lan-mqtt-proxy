FROM python:3.9-slim

WORKDIR /app

COPY ./requirements.txt .
RUN pip install --no-cache-dir -r ./requirements.txt
COPY ./wake_on_lan_mqtt_proxy.py .
# bind mount for config directory
# apps expect to find /app/config/config.yaml
RUN mkdir -p /app/config

CMD ["python", "wake_on_lan_mqtt_proxy.py"]