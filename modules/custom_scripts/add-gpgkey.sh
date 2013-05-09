#!/bin/bash
echo "Agregando clave publica de ParaguayEduca"
cp $PWD/misc/RPM-GPG-KEY-paraguayeduca.org $INSTALL_ROOT/tmp/
/usr/sbin/chroot $INSTALL_ROOT rpm --import /tmp/RPM-GPG-KEY-paraguayeduca.org
rm $INSTALL_ROOT/tmp/RPM-GPG-KEY-paraguayeduca.org
