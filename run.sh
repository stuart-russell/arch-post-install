#!/bin/sh

source utils/spinner.sh

echo "Starting post-installation steps..."

echo "Installing basic dependencies..."
run_script_with_spinner "steps/0-install-deps.sh"
echo "Enabling sudo..."
run_script_with_spinner "steps/1-enable-sudo.sh"
echo "Enabling multilib..."
run_script_with_spinner "steps/2-enable-multilib.sh"
echo "Running system updates..."
run_script_with_spinner "steps/3-update-system.sh"
echo "Adding users..."
run_script_with_spinner "steps/4-add-user.sh"
echo "Enabling AUR with YAY..."
run_script_with_spinner "steps/5-enable-yay.sh"
echo "Installing GPU drivers..."
run_script_with_spinner "steps/6-gpu-drivers.sh"
echo "Installing Flatpak..."
run_script_with_spinner "steps/7-flatpak.sh"
echo "Installing fonts..."
run_script_with_spinner "steps/8-fonts.sh"

echo "Post-installation complete!"