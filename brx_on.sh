#!/bin/bash
# Enable BRX dongle with MiSTer

# Location of init script
BRX_STARTUP_SCRIPT="/media/fat/linux/brx_init_script"

# Check if script exists
if [ ! -f ${BRX_STARTUP_SCRIPT} ]; then
	echo "BRX initialization script missing from:"
	echo "${BRX_STARTUP_SCRIPT}"
	echo "Cannot proceed."
	exit 1
fi

echo "Remounting root filesystem as read-write..."
mount | grep "on / .*[(,]ro[,$]" -q && RO_ROOT="true"
[ "${RO_ROOT}" == "true" ] && mount / -o remount,rw

echo "Adding startup script..."
ln -s ${BRX_STARTUP_SCRIPT} /etc/init.d/S99brx > /dev/null 2>&1

echo "Remounting root filesystem as read-only..."
sync
[ "${RO_ROOT}" == "true" ] && mount / -o remount,ro
sync

echo "Starting BRX..."
/etc/init.d/S99brx start

echo "Done!"
exit 0
