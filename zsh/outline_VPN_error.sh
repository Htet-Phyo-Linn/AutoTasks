#!/bin/bash
sudo pkill -9 outline-client
sudo pkill -9 OutlineProxyCon
sudo systemctl stop outline_proxy_controller.service
sudo systemctl stop NetworkManager

sudo systemctl start NetworkManager
sudo systemctl stop outline_proxy_controller.service
sudo systemctl restart NetworkManager
