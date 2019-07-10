#!/bin/bash

echo url="https://www.duckdns.org/update?domains=$DUCKDNS_DOMAINS&token=$DUCKDNS_TOKEN&ip=" | curl -k -o $LOG_DIR/duck.log -K -