# /bin/bash

# installs latest version of go-ipfs

ipfs_version=$(curl -s https://dist.ipfs.io/go-ipfs/versions | tail -1)
tmp_dir=$(mktemp -d)
cd $tmp_dir
curl "https://dist.ipfs.io/go-ipfs/${ipfs_version}/go-ipfs_${ipfs_version}_linux-amd64.tar.gz" | tar -xvz
bash go-ipfs/install.sh
cd -
rm -rf $tmp_dir
