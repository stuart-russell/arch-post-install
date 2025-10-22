#!/bin/sh

# Configure sudo permissions
echo "" >> /etc/sudoers
echo "## Enabled sudo privileges for users in the wheel group" >> /etc/sudoers
echo "%wheel ALL=(ALL:ALL) ALL" >> /etc/sudoers
