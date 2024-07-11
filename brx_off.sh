#!/bin/bash
# Disable BRX dongle with MiSTer

echo "Stopping service..."
/etc/init.d/S99brx stop

echo "Remounting root filesystem as read-write..."
mount | grep "on / .*[(,]ro[,$]" -q && RO_ROOT="true"
[ "${RO_ROOT}" == "true" ] && mount / -o remount,rw

echo "Removing startup script..."
rm /etc/init.d/S99brx > /dev/null 2>&1

echo "Remounting root filesystem as read-only..."
sync
[ "${RO_ROOT}" == "true" ] && mount / -o remount,ro
sync

echo "Done!"
exit 0
