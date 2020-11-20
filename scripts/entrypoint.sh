#!/usr/bin/env bash

export VPN_URL=$1
export CSD_HOST=${VPN_URL}
shift;

iptables -t nat -A POSTROUTING -o tun+ -j MASQUERADE

echo "Starting VPN"
openconnect ${@} ${VPN_URL} --csd-user=root --csd-wrapper=/scripts/csd.sh -b \
  && tinyproxy -d

