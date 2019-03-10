# Home Data System

This system is intended to collect, distribute and persist data from all suitable systems in a household.

The docker-compose file sets up these components

* prometheus (time series database)
* grafana (visualization)
* mosquitto (MQTT message broker, suitable for IoT purposes)
* mqtt_exporter (bridge to provide MQTT data to prometheus)

## Prometheus

Prometheus is set up in the simlplest possible way you will likely want to modify the setup.

The config file is [prometheus.yml](prometheus.yml). At least you need to adapt the scrape targets to your needs.

## Grafana

Simplistic setup too.

## mosquitto

Basic setup, no authentication etc. Adapt [mosquitto/mosquitto.conf](mosquitto/mosquitto.conf) to your needs.

## mqtt_exporter

I have added some examples for configuration I use.

You need to add your own configuration for your MQTT topics to [mqtt_exporter](mqtt_exporter/config)

## Installation & Start

* Prepare a volume for data storage. See also [Docker documentation for volumes](https://docs.docker.com/storage/volumes/).
  * I used for example 

    ```
    docker volume create --driver local \
    --opt type=ext4 \
    --opt device=/dev/sdd2 \
    home-data
    ```

  * Set up directory structure with (untested!!!)

    ```
    docker run -v home-data:/home-data -v <home-data-project-root>/setup-dirs.sh:/setup-dirs.sh debian:stretch-slim bash /setup-dirs.sh
    ```

  * Setup systemd unit (optional)

    ```
    sudo cp systemd/home-data-system.service /etc/systemd/system/
    systemctl daemon-reload
    systemctl enable home-data-system.service
    systemctl start home-data-system.service
    ```

  * Start manually (optional)

    ```
    docker-compose up
    ```

## Example for Usage

I will use it to collect data from and provide data to

* electricity meter
* solar power inverters
* battery power inverters
* EV wallbox
  * electricity meter
  * EVSE unit

## License

All files I wrote in this project are published under the GPL 3 license. A copy of this license is included in this project.

## Software and Trademarks

This project uses through the docker-compose file the following third-party components. Please note they come with their own licenses which you need to consider.

* [Prometheus](https://prometheus.io/) - Apache License 2.0
  * [Docker Hub image](https://hub.docker.com/r/prom/prometheus/)
* [Grafana](https://grafana.com/) - Apache License 2.0
  * [Docker Hub image](https://hub.docker.com/r/grafana/grafana)
* [mosquitto](https://mosquitto.org/) - Eclipse Public License 1.0 and Eclipse Distribution License 1.0
  * [Docker Hub image](https://hub.docker.com/_/eclipse-mosquitto)
* [mqtt_exporter](https://github.com/bendikwa/mqtt_exporter) - MIT License

### Trademarks

All trademarks used here are owned by their respective owners. :-)