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
