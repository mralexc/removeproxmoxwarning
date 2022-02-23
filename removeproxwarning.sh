#!/bin/bash
proxconfig="/usr/share/javascript/proxmox-widget-toolkit/proxmoxlib.js"

if [ -e $proxconfig ]; then
    cp $proxconfig $proxconfig-$(date +%F)
    sed -Ezi "s/(Ext.Msg.show\(\{\s+title: gettext\('No valid sub)/void\(\{ \/\/\1/g" $proxconfig

    systemctl restart pveproxy.service

    echo "Proxmox Subscription warning removed."
    echo "You may need to clear your cache"
else
    echo "Proxmox config not found!"
fi