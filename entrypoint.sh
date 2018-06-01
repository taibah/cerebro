#!/bin/bash

sed -i "s/basePath = \"\/\"/basePath = \"$(echo $BASEPATH | sed -e 's/\\/\\\\/g; s/\//\\\//g; s/&/\\\&/g')\"/g" /opt/cerebro/conf/application.conf
/opt/cerebro/bin/cerebro
sed -i "s/http:\/\/localhost:9200/$PROTOCOL:\/\/$ELASTICSEARCH_HOST:$ELASTICSEARCH_PORT/g" /opt/cerebro/conf/application.conf
mkdir /opt/cerebro/logs
/opt/cerebro/bin/cerebro
