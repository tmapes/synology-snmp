# FROM --platform=linux/x86_64 docker.mapes.info/telegraf:1.21.4
# Downgrading until https://github.com/influxdata/telegraf/issues/10554 is fixed
FROM --platform=linux/x86_64 docker.mapes.info/telegraf:1.20.4

COPY ./mibs /usr/share/snmp/mibs

RUN curl -sLo /usr/local/bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v1.2.5/dumb-init_1.2.5_x86_64 \
    && chmod +x /usr/local/bin/dumb-init

COPY telegraf.conf /etc/telegraf/telegraf.conf

ENTRYPOINT [ "/usr/local/bin/dumb-init", "--" ]
CMD [ "telegraf" ]
