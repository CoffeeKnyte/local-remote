#bin/bash

mkdir -p /opt/scripts/zenlocal
#sudo touch /var/log/rclone-zenstorage.log
#sudo touch /var/log/rclone-zenstorage-small.log
#sudo touch /var/log/rclone-zenstorage-metadata.log
#sudo chown seed:seed /var/log/rclone-*.log

kill $(pidof rclone)
sudo umount /mnt/unionfs
sudo umount /mnt/zenstorage
sudo umount /mnt/zenstorage-small
sudo umount /mnt/zenstorage-metadata
docker stop plex
docker stop plex2

sudo systemctl stop zenstorage.service
sudo systemctl disable zenstorage.service
sudo systemctl stop zenstorage-small.service
sudo systemctl disable zenstorage-small.service
sudo systemctl stop zenstorage-metadata.service
sudo systemctl disable zenstorage-metadata.service
sudo systemctl stop mergerfs.service
sudo systemctl disable mergerfs.service

sudo rm /etc/systemd/system/zenstorage.service
sudo rm /etc/systemd/system/zenstorage-small.service
sudo rm /etc/systemd/system/zenstorage-metadata.service
sudo rm /etc/systemd/system/mergerfs.service
sudo rm /opt/scripts/zenlocal/warmup.sh


sudo wget https://raw.githubusercontent.com/CoffeeKnyte/local-remote/main/service/zenstorage.service -P /etc/systemd/system/
sudo wget https://raw.githubusercontent.com/CoffeeKnyte/local-remote/main/service/zenstorage-small.service -P /etc/systemd/system/
sudo wget https://raw.githubusercontent.com/CoffeeKnyte/local-remote/main/service/zenstorage-metadata.service -P /etc/systemd/system/

sudo wget https://raw.githubusercontent.com/CoffeeKnyte/local-remote/main/service/mergerfs.service -P /etc/systemd/system/
sudo wget https://raw.githubusercontent.com/CoffeeKnyte/local-remote/main/service/warmup.sh -P /opt/scripts/zenlocal/
sudo chmod +x /opt/scripts/zenlocal/warmup.sh
sudo chown seed:seed /opt/scripts/zenlocal/warmup.sh

sudo systemctl daemon-reload
sleep 1
sudo systemctl enable zenstorage-small.service && sudo systemctl restart zenstorage-small.service
sudo systemctl enable zenstorage-metadata.service && sudo systemctl restart zenstorage-metadata.service
sudo systemctl enable zenstorage.service && sudo systemctl restart zenstorage.service
echo "Finished priming"
sudo rm -rf /mnt/unionfs/Media
sudo systemctl enable mergerfs.service && sudo systemctl restart mergerfs.service
sudo systemctl restart asian.service
sudo systemctl restart rclone_vfs.service
sudo systemctl restart rclone_vfs_primer.service
sleep 1
sudo systemctl enable poller.service && sudo systemctl restart poller.service
#restart all dockers
docker restart $(docker ps -q)
docker start plex
docker start plex2
