# /bin/bash

lsblk -I 8 -d

# args
DEVNAME=/dev/sda
MOUNT_PATH=/mnt/d

PART_DEV=${DEVNAME}1


sudo parted ${DEVNAME} --script mklabel gpt mkpart xfspart xfs 0% 100%
sudo mkfs.xfs ${PART_DEV}
sudo partprobe ${PART_DEV}
sudo mkdir ${MOUNT_PATH}
sudo chown $USER ${MOUNT_PATH}
sudo mount ${PART_DEV} ${MOUNT_PATH}
eval blkid -o export ${PART_DEV}
echo "UUID=${PARTUUID}  ${MOUNT_PATH}   xfs   defaults,nofail   1   2" | sudo tee -a /etc/fstab
