#!/bin/bash
RED='\033[1;31m'
YELLOW='\033[1;33m'
GREEN='\033[1;32m'
RESET='\033[0m'

frame=0

while true; do
    # مسح الشاشة وإرجاع المؤشر للأعلى
    echo -ne "\033[H\033[J"

    # --- رسم الجمجمة والعظام (متحركة) ---
    echo -e "${RED}"
    if [ "$frame" -eq 0 ]; then
        echo "                 .-\"\"\"-.            "
        echo "                / .===. \           "
        echo "                \/ 6 6 \/           " # العيون مفتوحة
        echo "                ( \___/ )           "
    else
        echo "                 .-\"\"\"-.            "
        echo "                / .===. \           "
        echo "                \/ - - \/           " # العيون مغمضة
        echo "                ( \___/ )           "
    fi
    echo "     _________ooo_________           "
    echo "    /                       \        "
    echo "   /  \          _          /  \     "
    echo "  /    \        / \        /    \    "
    echo " /      \      /   \      /      \   "
    echo "'--------'    '-----'    '--------'  "
    echo -e "${RESET}"

    # --- اسمك ---
    echo -e "${RED}"
    figlet -f slant "SHEHAB AQ"
    echo -e "${RESET}"

    # --- القائمة ---
    echo -e "${RED}============================================================${RESET}"
    echo -e "${YELLOW}          [ DARK WEB INTELLIGENCE SYSTEM ]${RESET}"
    echo -e "${RED}             RESTRICTED ACCESS - AUTHORIZED ONLY${RESET}"
    echo -e "${RED}============================================================${RESET}"
    echo ""
    echo -e "${RED}[1]${RESET} Sherlock (Username Tracker)"
    echo -e "${RED}[2]${RESET} PhoneInfoga (Phone Target)"
    echo -e "${RED}[3]${RESET} TheHarvester (Data Mining)"
    echo -e "${RED}[4]${RESET} Holehe (Email Breach)"
    echo -e "${RED}[5]${RESET} DNSRecon (Network Map)"
    echo -e "${RED}[6]${RESET} Whois Lookup (Domain Intel)"
    echo -e "${RED}[7]${RESET} Nmap Fast Scan (Port Hunter)"
    echo -e "${RED}[8]${RESET} Exit System"
    echo ""
    echo -ne "${RED}root@shehab:~# ${RESET}"

    # --- السر هنا: قراءة حرف واحد مع مهلة 0.5 ثانية ---
    if read -t 0.5 -n 1 -s key; then
        # بمجرد الضغط على أي زر، تتوقف الحركة وتنتظرك لتكمل الكتابة
        echo -ne "$key" 
        read -e rest
        choice="$key$rest"

        case $choice in
            1) echo -e "${GREEN}[*] Executing Sherlock...${RESET}"; read -p "Target Username: " t; sherlock "$t" | tee ~/Desktop/sherlock_$t.txt ;;
            2) echo -e "${GREEN}[*] Executing PhoneInfoga...${RESET}"; read -p "Target Phone: " t; phoneinfoga scan -n "$t" | tee ~/Desktop/phone_$t.txt ;;
            3) echo -e "${GREEN}[*] Executing TheHarvester...${RESET}"; read -p "Target Domain: " t; theHarvester -d "$t" -b all -l 100 | tee ~/Desktop/harv_$t.txt ;;
            4) echo -e "${GREEN}[*] Executing Holehe...${RESET}"; read -p "Target Email: " t; holehe "$t" | tee ~/Desktop/holehe_$t.txt ;;
            5) echo -e "${GREEN}[*] Executing DNSRecon...${RESET}"; read -p "Target Domain: " t; dnsrecon -d "$t" --lifetime 10 | tee ~/Desktop/dns_$t.txt ;;
            6) echo -e "${GREEN}[*] Executing Whois...${RESET}"; read -p "Target Domain/IP: " t; whois "$t" | tee ~/Desktop/whois_$t.txt ;;
            7) echo -e "${GREEN}[*] Executing Nmap...${RESET}"; read -p "Target IP: " t; nmap -F "$t" | tee ~/Desktop/nmap_$t.txt ;;
            8) echo -e "${RED}[*] Shutting Down System...${RESET}"; exit 0 ;;
            *) echo -e "${RED}[-] Invalid Command!${RESET}"; sleep 1 ;;
        esac
        echo -e "\n${YELLOW}[*] Operation Complete. Press Enter...${RESET}"
        read
    fi

    # تبديل حالة العيون (مفتوحة / مغمضة)
    frame=$((1 - frame))
done
