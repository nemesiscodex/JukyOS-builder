# Copyright (C) 2009 One Laptop Per Child
# Licensed under the terms of the GNU GPL v2 or later; see COPYING for details.

. $OOB__shlib
compress=$(read_config sd_card_image compress_disk_image)
keep_img=$(read_config sd_card_image keep_disk_image)
make_zd=$(read_config sd_card_image make_zd)
osname=$(image_name)

function make_zd() {
	local ext=$1
	[ -z "$ext" ] && ext="zd"

	local output_name=$osname.$ext
	local diskimg=$intermediatesdir/$output_name.disk.img
	local output=$outputdir/$output_name

	if [[ "$make_zd" == 1 ]]; then
		echo "Making ZD image for $output_name..."
		$bindir/zhashfs 0x20000 sha256 $diskimg $output.zsp $output

		echo "Creating MD5sum of $output_name..."
		pushd $outputdir >/dev/null
		md5sum $output_name > $output_name.md5
		popd >/dev/null
	fi

	if [[ "$keep_img" == "1" ]]; then
		if [[ "$compress" == "1" ]]; then
			echo "Compressing disk image..."
			tar -czS -f $output.disk.img.tar.gz -C $intermediatesdir $output_name.disk.img
			rm -f $diskimg
		else
			mv $diskimg $outputdir
		fi
	fi

}

found=0
oIFS=$IFS
IFS=$'\n'
for line in $(env); do
	[[ "${line:0:24}" == "CFG_sd_card_image__size_" ]] || continue
	vals=${line#*=}
	disk_size=${vals%,*}
	ext=
	expr index "$vals" ',' &>/dev/null && ext=${vals#*,}
	make_zd $ext
	found=1
done
IFS=$oIFS

# When no size options were specified, we make a default image.
[ "$found" = "1" ] || make_zd
