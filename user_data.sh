#!/bin/bash
apt update -y
apt install wget -y
wget https://raw.githubusercontent.com/Selphines/terraform/main/web.sh
chmod +x web.sh
./web.sh
