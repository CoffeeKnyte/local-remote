### Adding a 16GB swap.img file in btrfs
sudo swapoff /swap.img
sudo rm  /swap.img
truncate -s 0 /swap.img
chattr +C /swap.img
btrfs property set /swap.img compression none
fallocate -l 16G /swap.img
chmod 600 /swap.img
mkswap /swap.img
sudo swapon /swap.img
sudo nano /etc/fstab
#check that you have this line
#>> /swap.img       none    swap    sw      0       0

#check that the swap works
#>> free -h


### adding Specific rclone 1.54.0-beta-4948
wget https://beta.rclone.org/v1.54.0-beta.4948.8a429d12c/rclone-v1.54.0-beta.4948.8a429d12c-linux-amd64.deb -O rclone-v1.54.0-beta-4948.deb 
sudo dpkg -i ./rclone-v1.54.0-beta-4948.deb && rclone version
### adding Specific mergerfs 2.30.0
wget https://github.com/trapexit/mergerfs/releases/download/2.30.0/mergerfs_2.30.0.ubuntu-bionic_amd64.deb -P /opt/scripts/installers
sudo dpkg -i  /opt/scripts/installers/mergerfs_2.30.0.ubuntu-bionic_amd64.deb

