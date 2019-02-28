#!/bin/bash
# From DOS prompt type (git update-index --chmod=+x installAsService.sh) to make this file executable.
set -e
echo "NPM post install shell that installs this app as service starts now..."
echo "Set irdclient as defalut group for HardinRiverGauge -> sudo chown :irdclient ../HardinRiverGauge"
sudo chown :irdclient ../HardinRiverGauge
echo "Give default group write access to the HardinRiverGauge directory -> sudo chmod g+w ../HardinRiverGauge"
sudo chmod g+w ../HardinRiverGauge
echo "Install D-Bus config file for this service -> sudo cp ./postInstall/dbus.conf /etc/dbus-1/system.d/HardinRiverGauge.conf"
sudo cp ./postInstall/dbus.conf /etc/dbus-1/system.d/HardinRiverGauge.conf
echo "Install systemd service file -> sudo cp -n ./postInstall/server.service /etc/systemd/system/HardinRiverGauge.service"
sudo cp -n ./postInstall/server.service /etc/systemd/system/HardinRiverGauge.service
echo "Enable the servers to start on reboot -> systemctl enable HardinRiverGauge.service"
sudo systemctl enable HardinRiverGauge.service
#echo "Start the service now -> systemctl start HardinRiverGauge.service"
#sudo systemctl start HardinRiverGauge.service
echo "NPM Post install shell is complete."
echo "To start this servers please reboot the server. After reboot Type -> journalctl -u HardinRiverGauge -f <- to see status."