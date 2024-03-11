#!/bin/sh
/bin/cp -f /shared/provision/hosts /etc/hosts
chmod 644 /etc/hosts
chown root:root /etc/hosts
