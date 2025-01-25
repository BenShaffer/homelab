#!/bin/bash

# Config file: /etc/samba/smb.conf
# Add the following:
# [files]
#   comment = RAID1 configured storage
#   path = /media/share
#   read only = no
#   browsable = yes
#   writeable = yes
#   create mask = 0777
#   directory mask = 0777
#   force create mode = 0777
#   force directory mode = 0777
#   force user = bcsh

# /var/log/samba for connection logs