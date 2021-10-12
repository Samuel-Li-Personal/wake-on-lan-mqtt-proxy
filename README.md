# wake-on-lan-mqtt-proxy

Proxying wake-on-lan request on a different subnet using MQTT messaging.

Build me: `./scripts/build.sh`

Run me: `./scripts/run.sh` (after creating config.yaml from config.template.yaml)

To start automatically on Raspberry Pi OS:
1. ```cp wake-on-lan-mqtt-proxy.template.service /lib/systemd/system/wake-on-lan-mqtt-proxy.service```
1. Update `/lib/systemd/system/wake-on-lan-mqtt-proxy.service` to suit your needs.
1. `sudo service start wake-on-lan-mqtt-proxy`
