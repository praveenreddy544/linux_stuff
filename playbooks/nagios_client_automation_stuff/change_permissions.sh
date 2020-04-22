#!/bin/bash
if [[ $EUID -eq 0 ]]; then
cd /usr/local/nagios/etc/servers/
chown nagios:nagios *
chmod 0755 *
else
  echo "scirpt must be run as root"
fi
