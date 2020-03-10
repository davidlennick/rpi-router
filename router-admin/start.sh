#!/bin/bash

echo "Starting webmin..."
service webmin start 
tail -F /var/webmin/miniserv.error