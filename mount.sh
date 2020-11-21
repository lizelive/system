# /bin/bash

lsblk -I 8 -d

# args
DEVNAME=/dev/sdb
MOUNT_PATH=/datadrive

PART_DEV=${DEVNAME}1


parted ${DEVNAME} --script mklabel gpt mkpart xfspart xfs 0% 100%
mkfs.xfs ${PART_DEV}
partprobe ${PART_DEV}
mkdir /datadrive
mount ${PART_DEV} /datadrive
eval blkid -o export ${PART_DEV}
echo UUID=${PARTUUID}  ${MOUNT_PATH}   xfs   defaults,nofail   1   2 >> /etc/fstab
