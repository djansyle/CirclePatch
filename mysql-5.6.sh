`#!/bin/bash

pwd
set -x
set -e

export DEBIAN_FRONTEND=noninteractive

curl -LO http://repo.mysql.com//mysql-apt-config_0.7.3-1_all.deb
echo mysql-apt-config mysql-apt-config/select-product select Apply | sudo debconf-set-selections
echo mysql-apt-config mysql-apt-config/select-server select mysql-5.6 | sudo debconf-set-selections
echo mysql-apt-config mysql-apt-config/select-connector-python select none | sudo debconf-set-selections
echo mysql-apt-config mysql-apt-config/select-workbench select none | sudo debconf-set-selections
echo mysql-apt-config mysql-apt-config/select-utilities select none | sudo debconf-set-selections
echo mysql-apt-config mysql-apt-config/select-connector-odbc select connector-odbc-x.x | sudo debconf-set-selections
sudo -E dpkg -i mysql-apt-config_0.7.3-1_all.deb
sudo apt-get update
sudo -E apt-get -y install mysql-server-5.6

echo "Checking installed version....."
mysql -D mysql -e "SELECT version()"
echo "Done!!"
pwd`
