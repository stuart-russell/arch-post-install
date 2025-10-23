#!/bin/bash

source utils/colour.sh

spinner() {
    local pid=$1
    local delay=0.1
    local spinstr='|/-\'
    while kill -0 $pid 2>/dev/null; do
        local temp=${spinstr#?}
        printf " ${YELLOW}[%c]${NC}  ${BLUE}Executing...${NC}" "$spinstr"
        spinstr=$temp${spinstr%"$temp"}
        sleep $delay
        printf "\r"
    done
    printf "    \r"
}

run_script_with_spinner() {
    local script_file="$1"
    local username="$2"
    local error_log="error.log"

    # Trap ERR to log errors
    trap 'echo "Error occurred in $script_file at line $LINENO" >> "$error_log"' ERR

    bash "$script_file" "$username" > /dev/null 2>&1 &
    local script_pid=$!
    spinner $script_pid
    wait $script_pid
    local status=$?
    trap - ERR  # Remove trap after script finishes

    if [ $status -eq 0 ]; then
        echo -e "${GREEN}Done.${NC}"
    else
        echo -e "${RED}Failed (exit code $status).${NC}"
        echo "Script $script_file failed with exit code $status" >> "$error_log"
    fi
}
