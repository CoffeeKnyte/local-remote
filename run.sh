#bin/bash

mkdir -p /mnt/zenstorage
mkdir -p /mnt/zenremote

sudo wget https://raw.githubusercontent.com/CoffeeKnyte/local-remote/main/service/zenremote.service -P /etc/systemd/system/
sudo wget https://raw.githubusercontent.com/CoffeeKnyte/local-remote/main/service/zenremote_primer.service -P /etc/systemd/system/
sudo wget https://raw.githubusercontent.com/CoffeeKnyte/local-remote/main/service/zenremote_primer.timer -P /etc/systemd/system/

sudo wget https://raw.githubusercontent.com/CoffeeKnyte/local-remote/main/service/zenstorage.service -P /etc/systemd/system/
sudo wget https://raw.githubusercontent.com/CoffeeKnyte/local-remote/main/service/zenstorage_primer.service -P /etc/systemd/system/
sudo wget https://raw.githubusercontent.com/CoffeeKnyte/local-remote/main/service/zenstorage_primer.timer -P /etc/systemd/system/

sudo rm  /etc/systemd/system/mergerfs.service

sudo wget https://raw.githubusercontent.com/CoffeeKnyte/local-remote/main/service/mergerfs.service -P /etc/systemd/system/

sudo systemctl daemon-reload
sudo systemctl enable zenstorage.service && sudo systemctl enable zenstorage_primer.service
sleep 10
sudo systemctl enable zenremote.service && sudo systemctl enable zenremote_primer.service
sleep 10
sudo systemctl restart zenstorage.service && sudo systemctl restart zenstorage_primer.service && sudo systemctl restart zenremote.service && sudo systemctl restart zenremote_primer.service && sudo systemctl restart mergerfs.service

#restart all dockers
docker restart $(docker ps -q)
