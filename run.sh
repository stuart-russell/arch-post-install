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

# Create user and grant sudo privileges         #
read -p "Enter the username to create: " username
useradd -m -G wheel,users -s /bin/bash $username
passwd $username
# --------------------------------------------- #

echo -e "${NEWLINE}"
echo -e "${YELLOW}Enabling AUR with YAY...${NC}${NEWLINE}"
run_script_with_spinner "steps/4-enable-yay.sh" "$username"
echo -e "${YELLOW}Installing GPU drivers...${NC}${NEWLINE}"
run_script_with_spinner "steps/5-gpu-drivers.sh"
echo -e "${YELLOW}Installing Flatpak...${NC}${NEWLINE}"
run_script_with_spinner "steps/6-flatpak.sh"
echo -e "${YELLOW}Installing fonts...${NC}${NEWLINE}"
run_script_with_spinner "steps/7-fonts.sh"
echo -e "${YELLOW}Installing fonts...${NC}${NEWLINE}"
run_script_with_spinner "steps/7-fonts.sh"
echo -e "${YELLOW}Enabling system services...${NC}${NEWLINE}"
run_script_with_spinner "steps/8-enable-services.sh"

echo -e "${GREEN}Post-installation complete!${NC}${NEWLINE}"