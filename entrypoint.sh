#!/bin/bash

sed -i "s/basePath = \"\/\"/basePath = \"$(echo $BASEPATH | sed -e 's/\\/\\\\/g; s/\//\\\//g; s/&/\\\&/g')\"/g" application.conf
/opt/cerebro/bin/cerebro
