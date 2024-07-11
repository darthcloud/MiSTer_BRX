# MiSTer_BRX
BRX dongle controller support for the MiSTer FPGA

This is a fork base on:
https://github.com/Mellified/MiSTer_Duke/

## Contents
* brx_init_script - init.d script to enable or disable support
* brx_on.sh - MiSTer script to install init script and enable support for BRX dongle
* brx_off.sh - MiSTer script to remove init script and disable support for BRX dongle

## Installation
1. Download the [latest release](https://github.com/darthcloud/MiSTer_BRX/releases/latest).
2. Unzip files to the MiSTer's SD card base directory (/media/fat/).

## Usage
1. From the MiSTer main menu open the OSD (F12).
2. Navigate to **Scripts**.
3. To enable BRX support, navigate to the **duke_on** entry and hit enter.
4. To disable BRX support, navigate to the **duke_off** entry and hit enter.

## Technical Details
The BRX dongle uses the standard OG Xbox interface over USB supported by MiSTer's xpad linux driver. However, it uses the Espressif USB vendor ID, rather than the typical Microsoft vendor ID. The on script simply adds Espressif's vendor ID via the xpad /sys/ interface and pokes xpad to update. A init.d entry is also added to automatically enable support at startup.

The brx_off script removes the Espressif vendor ID from xpad, pokes it, and removes the init.d script.
