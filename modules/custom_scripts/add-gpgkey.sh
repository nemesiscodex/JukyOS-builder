#!/bin/bash
echo "Agregando clave publica de ParaguayEduca"
cp $PWD/misc/juky-pubkey.asc $INSTALL_ROOT/tmp/
/usr/sbin/chroot $INSTALL_ROOT rpm --import /tmp/juky-pubkey.asc
rm $INSTALL_ROOT/tmp/juky-pubkey.asc
