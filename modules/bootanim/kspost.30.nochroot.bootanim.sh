# Copyright (C) 2011 One Laptop Per Child
# Licensed under the terms of the GNU GPL v2 or later; see COPYING for details.

. $OOB__shlib

custom_image1=$(read_config bootanim custom_image1)
custom_image2=$(read_config bootanim custom_image2)
theme=$(read_config bootanim theme)

if [ -n "$custom_image" ]; then
	echo "cp $custom_image1 \$INSTALL_ROOT/usr/share/plymouth/themes/olpc/custom.png"
	echo "cp $custom_image2 \$INSTALL_ROOT/usr/share/plymouth/themes/olpc/fedora.png"
fi

if [ -n "$theme" ]; then
	echo "/usr/sbin/plymouth-set-default-theme $theme"
fi
