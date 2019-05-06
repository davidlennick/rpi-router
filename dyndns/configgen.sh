#!/bin/bash

cd /app

echo "USERNAME=$NOIP_UN" >> noip_conf && \
echo "PASSWORD=$NOIP_PW" >> noip_conf && \
echo "DOMAINS=$NOIP_DOMAINS" >> noip_conf && \
echo "LOGDIR=$LOG_DIR" >> noip_conf && \
echo "ROTATE_LOGS=true" >> noip_conf

#cat noip_conf