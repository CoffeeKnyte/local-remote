sudo mv /opt/scripts/zenlocal/zenlocalpoller /opt/scripts/zenlocal/zenlocalpoller.old 
sudo wget https://raw.githubusercontent.com/zenjabba/ZenDRIVE-Poller-Binary/main/zenlocalpoller -P /opt/scripts/zenlocal/
sudo wget https://raw.githubusercontent.com/zenjabba/ZenDRIVE-Poller-Binary/main/start_poller.sh -P /opt/scripts/zenlocal/
sudo mv start_poller.sh zenpoller.sh
sudo chmod +x /opt/scripts/zenlocal/zen*
sudo chown seed:seed /opt/scripts/zenlocal/zen*

mkdir -p /opt/scripts/zenlocal/logs
touch /opt/scripts/zenlocal/logs/poller.log

sudo wget https://raw.githubusercontent.com/CoffeeKnyte/local-remote/main/service/poller.service -P /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl enable poller.service && sudo systemctl restart poller.service
