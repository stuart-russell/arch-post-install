#!/bin/sh


source utils/colour.sh
source utils/spinner.sh

NEWLINE="\n"

echo -e "${BLUE}Starting post-installation steps...${NC}${NEWLINE}"

echo -e "${YELLOW}Installing basic dependencies...${NC}${NEWLINE}"
run_script_with_spinner "steps/0-install-deps.sh"
echo -e "${YELLOW}Enabling sudo...${NC}${NEWLINE}"
run_script_with_spinner "steps/1-enable-sudo.sh"
echo -e "${YELLOW}Enabling multilib...${NC}${NEWLINE}"
run_script_with_spinner "steps/2-enable-multilib.sh"
echo -e "${YELLOW}Running system updates...${NC}${NEWLINE}"
run_script_with_spinner "steps/3-update-system.sh"
echo -e "${YELLOW}Adding users...${NC}${NEWLINE}"

# When creating a new user, I couldn't find a way to pass
# the username variable to subsequent commands using the existing method,
# so I've inlined the username variable
# Create user and grant sudo privileges ------- #
read -p "Enter the username to create: " username
useradd -m -G wheel,users -s /bin/bash $username
passwd $username
# --------------------------------------------- #

# Clone yay from AUR and install -------------- #
sudo -u $username git clone https://aur.archlinux.org/yay.git /tmp/yay
sudo -u $username cd /tmp/yay
sudo -u $username makepkg -si --noconfirm
sudo -u $username cd -
sudo -u $username rm -rf /tmp/yay
# --------------------------------------------- #

# Install GuiMan ------------------------------ #
sudo -u $username yay -S guiman --noconfirm
# --------------------------------------------- #

echo -e "${NEWLINE}"
echo -e "${YELLOW}Installing GPU drivers...${NC}${NEWLINE}"
run_script_with_spinner "steps/6-gpu-drivers.sh"
echo -e "${YELLOW}Installing Flatpak...${NC}${NEWLINE}"
run_script_with_spinner "steps/7-flatpak.sh"
echo -e "${YELLOW}Installing fonts...${NC}${NEWLINE}"
run_script_with_spinner "steps/8-fonts.sh"

echo -e "${GREEN}Post-installation complete!${NC}${NEWLINE}"