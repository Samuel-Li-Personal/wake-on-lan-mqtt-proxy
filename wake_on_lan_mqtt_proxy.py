from paho.mqtt import client as mqtt_client
import yaml
from wakeonlan import send_magic_packet
import logging

logging.basicConfig(
    format='%(asctime)s %(levelname)-8s %(message)s',
    level=logging.INFO,
    datefmt='%Y-%m-%d %H:%M:%S')
logger = logging.getLogger()

with open("/app/config/config.yaml", "r") as configfile:
    config = yaml.load(configfile, Loader=yaml.FullLoader)

broker = config['mqtt_host']
port = 1883
topic = config['topic']
client_id = config['mqtt_client_id']
tv_mac_address = config['tv_mac_adddress']

def connect_mqtt() -> mqtt_client:
    def on_connect(client, userdata, flags, rc):
        if rc == 0:
            logger.info("Connected to MQTT Broker!")
        else:
            logger.info("Failed to connect, return code %d\n", rc)

    client = mqtt_client.Client(client_id)
    client.username_pw_set(config["mqtt_user"], config["mqtt_password"])
    client.on_connect = on_connect
    client.connect(broker, port)
    return client


def subscribe(client: mqtt_client):
    def on_message(client, userdata, msg):
        logger.info(f"Received `{msg.payload.decode()}` from `{msg.topic}` topic")
        send_magic_packet(tv_mac_address)

    logger.info(f"subscribing '{topic}'")
    client.subscribe(topic)
    client.on_message = on_message


def run():
    client = connect_mqtt()
    subscribe(client)
    client.loop_forever()


if __name__ == '__main__':
    run()