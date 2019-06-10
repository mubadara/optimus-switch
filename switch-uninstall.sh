#!/bin/sh

#optimus-switch (LightDM) uninstall script.

if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

echo 'Removing optimus-switch'

rm -rf /usr/local/bin/set-intel.sh
rm -rf /usr/local/bin/set-nvidia.sh
rm -rf /usr/local/bin/optimus.sh
rm -rf /etc/switch

systemctl disable disable-nvidia.service
rm -rf /etc/systemd/system/disable-nvidia.service

rm -rf /etc/X11/mhwd.d/99-nvidia.conf
rm -rf /etc/X11/xorg.conf.d/99-nvidia.conf
rm -rf /etc/modprobe.d/99-nvidia.conf
rm -rf /etc/modules-load.d/99-nvidia.conf

rm -rf /etc/X11/xorg.conf.d/99-intel.conf
rm -rf /etc/modprobe.d/99-intel.conf
rm -rf /etc/modules-load.d/99-intel.conf

sleep 1
echo 'optimus-switch is now uninstalled'
echo 'Dont forget to edit /etc/lightdm.conf and comment out the'
echo 'display-setup-script= line you edited when installing optimus-switch'
echo '########'
echo 'if you reboot now, you will not have a working Xorg setup.'
echo 'setup another optimus solution before rebooting.'
rm -rf uninstall-switch.sh 
