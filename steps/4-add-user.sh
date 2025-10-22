#!/bin/sh

# Create user and grant sudo privileges
read -p "Enter the username to create: " username
useradd -m -G wheel,users -s /bin/bash $username
passwd $username

export USERNAME=$username
