# /bin/bash

lsblk -I 8 -d

# args
DEVNAME=/dev/sda
MOUNT_PATH=/datadrive

PART_DEV=${DEVNAME}1


sudo parted ${DEVNAME} --script mklabel gpt mkpart xfspart xfs 0% 100%
sudo mkfs.xfs ${PART_DEV}
sudo partprobe ${PART_DEV}
sudo mkdir /datadrive
sudo chown $USER /datadrive
sudo mount ${PART_DEV} /datadrive
eval blkid -o export ${PART_DEV}
echo "UUID=${PARTUUID}  ${MOUNT_PATH}   xfs   defaults,nofail   1   2" | sudo tee -a /etc/fstab
