#!/bin/bash
apt update -y
apt install wget -y
wget https://raw.githubusercontent.com/Selphines/terraform/main/web.sh
wget https://raw.githubusercontent.com/Selphines/terraform/main/useradd.sh
chmod +x web.sh
chmod +x useradd.sh
./web.sh
./useradd.sh
