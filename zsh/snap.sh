#!/bin/bash

systemctl restart snapd.service 
systemctl restart snapd.apparmor.service 
systemctl restart snapd.socket

