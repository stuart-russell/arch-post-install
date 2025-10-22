#!/bin/bash

source colour.sh

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
    bash "$script_file" > /dev/null 2>&1 &
    local script_pid=$!
    spinner $script_pid
    wait $script_pid
    local status=$?
    if [ $status -eq 0 ]; then
        echo -e "${GREEN}Done.${NC}"
    else
        echo -e "${RED}Failed (exit code $status).${NC}"
    fi
}
