#!/bin/bash

enable_services () {
    systemctl enable fstrim.timer
    systemctl start fstrim.timer
    systemctl enable sddm.service
    systemctl start sddm.service
}
