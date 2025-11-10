#!/bin/bash

sudo systemctl enable fstrim.timer
sudo systemctl start fstrim.timer
sudo systemctl enable sddm.service
sudo systemctl start sddm.service