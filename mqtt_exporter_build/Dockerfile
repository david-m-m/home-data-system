FROM python:2-slim

RUN apt-get update; apt-get install -y --no-install-recommends git; apt-get clean;
RUN mkdir /app -p ; cd /app; \
    git clone https://github.com/bendikwa/mqtt_exporter.git; cd mqtt_exporter; pip install -r requirements.txt; \ 
    chmod +x mqtt_exporter.py

VOLUME [ "/mqtt_exporter" ]

CMD [ "/app/mqtt_exporter/mqtt_exporter.py", "-c","/mqtt_exporter/config" ]
