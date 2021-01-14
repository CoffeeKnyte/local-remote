#bin/bash

mkdir -p /opt/scripts/zenlocal
sudo touch /var/log/rclone-zenstorage.log
sudo touch /var/log/rclone-zenstorage-small.log
sudo touch /var/log/rclone-zenstorage-metadata.log
sudo chown seed:seed /var/log/rclone-*.log

kill $(pidof rclone)
sudo umount /mnt/unionfs
sudo umount /mnt/zenstorage
sudo umount /mnt/zenstorage-small
sudo umount /mnt/zenstorage-metadata

sudo rm /etc/systemd/system/zenstorag*.service
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
sudo systemctl enable zenstorage.service && sudo systemctl restart zenstorage.service
echo "Finished priming"
sudo systemctl enable zenstorage-small.service && sudo systemctl restart zenstorage-small.service
sudo systemctl enable zenstorage-metadata.service && sudo systemctl restart zenstorage-metadata.service
sudo rm -rf /mnt/unionfs/Media
sudo systemctl enable mergerfs.service && sudo systemctl restart mergerfs.service 
sleep 1
#restart all dockers
docker restart $(docker ps -q)
