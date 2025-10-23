#!/bin/bash

source ./utils/text.sh
source ./utils/spinner.sh

printf "${YELLOW}Stuarts Arch Auto-Configuration${NC}${NEWLINE}"
echo -e "${LIGHT_BLUE}Hello, ${USER}${NC}${NEWLINE}"

echo -e "${CYAN}Configuring OS...${NC}${NEWLINE}"
run_script_with_spinner "configure-os.sh"

echo -e "${CYAN}Installing AUR and Pacman packages...${NC}${NEWLINE}"
run_script_with_spinner "install-packages.sh"
