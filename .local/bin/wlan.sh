#!/bin/sh
wlan_ssid=$(wpa_cli status| grep ^ssid | sed s/ssid=//g)
wlan_if=$(wpa_cli status| grep interface | sed -E "s/(.+)'(.+)'/\2/g")
wlan_ip=$(wpa_cli status| grep ^ip_address | sed s/ip_address=//g)

echo "$wlan_if $wlan_ssid $wlan_ip"