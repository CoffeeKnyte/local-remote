sudo mv /opt/scripts/zenlocal/zenlocalpoller /opt/scripts/zenlocal/zenlocalpoller.old 
sudo mv /opt/scripts/zenlocal/zenpoller.sh /opt/scripts/zenlocal/zenpoller.sh.old 
sudo wget https://raw.githubusercontent.com/zenjabba/ZenDRIVE-Poller-Binary/main/zenlocalpoller -P /opt/scripts/zenlocal/
sudo wget https://raw.githubusercontent.com/CoffeeKnyte/local-remote/main/service/zenpoller.sh -P /opt/scripts/zenlocal/
sudo chmod +x /opt/scripts/zenlocal/zen*
sudo chown seed:seed /opt/scripts/zenlocal/zen*

mkdir -p /opt/scripts/zenlocal/logs
touch /opt/scripts/zenlocal/logs/poller.log

sudo rm /etc/systemd/system/poller.service
sudo wget https://raw.githubusercontent.com/CoffeeKnyte/local-remote/main/service/poller.service -P /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl enable poller.service && sudo systemctl restart poller.service
docker restart autoscan
