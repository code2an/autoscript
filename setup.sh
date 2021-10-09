#!/bin/bash
if [ "${EUID}" -ne 0 ]; then
		echo "You need to run this script as root"
		exit 1
fi
if [ "$(systemd-detect-virt)" == "openvz" ]; then
		echo "OpenVZ is not supported"
		exit 1
fi
apt install screen wget curl -y
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- ipinfo.io/ip);
IZIN=$(curl https://raw.githubusercontent.com/code2an/izin/main/ip | grep $MYIP )
if [ $MYIP = $IZIN ]; then
echo -e "${green}Permission Accepted...${NC}"
else
echo -e "${red}Permission Denied!${NC}";
echo "Please Contact Admin"
echo "Telegram t.me/senowahyu62"
echo "WhatsApp wa.me/6282220155143"
rm -f setup.sh
exit 0
fi
if [ -f "/etc/v2ray/domain" ]; then
echo "Script Already Installed"
exit 0
fi
mkdir /var/lib/premium-script;
echo "IP=" >> /var/lib/premium-script/ipvps.conf
#Generate Domain, sudah jalan
wget https://raw.githubusercontent.com/senowahyu62/autoscript/main/cf.sh && chmod +x cf.sh && ./cf.sh

#install ssh ovpn, sudha di cek
wget https://raw.githubusercontent.com/senowahyu62/autoscript/main/ssh-vpn.sh && chmod +x ssh-vpn.sh && screen -S ssh-vpn ./ssh-vpn.sh
wget https://raw.githubusercontent.com/senowahyu62/autoscript/main/sstp.sh && chmod +x sstp.sh && screen -S sstp ./sstp.sh

#install ssr, sudah di cek
wget https://raw.githubusercontent.com/senowahyu62/autoscript/main/ssr.sh && chmod +x ssr.sh && screen -S ssr ./ssr.sh
wget https://raw.githubusercontent.com/senowahyu62/autoscript/main/sodosok.sh && chmod +x sodosok.sh && screen -S ss ./sodosok.sh

#installwg , sudah dicek
wget https://raw.githubusercontent.com/senowahyu62/autoscript/main/wg.sh && chmod +x wg.sh && screen -S wg ./wg.sh

#install v2ray, sudah jalan
wget https://raw.githubusercontent.com/senowahyu62/autoscript/main/ins-vt.sh && chmod +x ins-vt.sh && screen -S v2ray ./ins-vt.sh

#install L2TP, sudah di cek
wget https://raw.githubusercontent.com/senowahyu62/autoscript/main/ipsec.sh && chmod +x ipsec.sh && screen -S ipsec ./ipsec.sh
wget https://raw.githubusercontent.com/senowahyu62/autoscript/main/set-br.sh && chmod +x set-br.sh && ./set-br.sh

wget -O /usr/bin/infov2 https://raw.githubusercontent.com/senowahyu62/autoscript/main/infov2.sh && chmod +x /usr/bin/infov2
wget -O /usr/bin/add-host https://raw.githubusercontent.com/senowahyu62/autoscript/main/add-host.sh && chmod +x /usr/bin/add-host
wget -O /usr/bin/trojan-menu https://raw.githubusercontent.com/senowahyu62/autoscript/main/trojan-menu.sh && chmod +x /usr/bin/trojan-menu
wget -O /usr/bin/vmess-menu https://raw.githubusercontent.com/senowahyu62/autoscript/main/vmess-menu.sh && chmod +x /usr/bin/vmess-menu
wget -O /usr/bin/vless-menu https://raw.githubusercontent.com/senowahyu62/autoscript/main/vless-menu.sh && chmod +x /usr/bin/vless-menu
wget -O /usr/bin/l2tp-menu https://raw.githubusercontent.com/senowahyu62/autoscript/main/l2tp-menu.sh && chmod +x /usr/bin/l2tp-menu
wget -O /usr/bin/shadowsockr-menu https://raw.githubusercontent.com/senowahyu62/autoscript/main/shadowsockr-menu.sh && chmod +x /usr/bin/shadowsockr-menu
wget -O /usr/bin/shadowsocks-menu https://raw.githubusercontent.com/senowahyu62/autoscript/main/shadowsocks-menu.sh && chmod +x /usr/bin/shadowsocks-menu
wget -O /usr/bin/wireguard-menu https://raw.githubusercontent.com/senowahyu62/autoscript/main/wireguard-menu.sh && chmod +x /usr/bin/wireguard-menu
wget -O /usr/bin/pengaturan-menu https://raw.githubusercontent.com/senowahyu62/autoscript/main/pengaturan-menu.sh && chmod +x /usr/bin/pengaturan-menu
rm -f /root/ssh-vpn.sh
rm -f /root/sstp.sh
rm -f /root/wg.sh
rm -f /root/ss.sh
rm -f /root/ssr.sh
rm -f /root/ins-vt.sh
rm -f /root/ipsec.sh
rm -f /root/set-br.sh
history -c
echo "1.2" > /home/ver
clear
echo " "
echo "Installation has been completed!!"
echo " "
echo "=================================-Autoscript Premium-===========================" | tee -a log-install.txt
echo "" | tee -a log-install.txt
echo "--------------------------------------------------------------------------------" | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   >>> Service & Port"  | tee -a log-install.txt
echo "   - OpenSSH                 : 22"  | tee -a log-install.txt
echo "   - OpenVPN                 : TCP 1194, UDP 2200, SSL 442"  | tee -a log-install.txt
echo "   - Stunnel4                : 443, 777"  | tee -a log-install.txt
echo "   - Dropbear                : 109, 143"  | tee -a log-install.txt
echo "   - Squid Proxy             : 3128, 8080 (limit to IP Server)"  | tee -a log-install.txt
echo "   - Badvpn                  : 7100, 7200, 7300"  | tee -a log-install.txt
echo "   - Nginx                   : 81"  | tee -a log-install.txt
echo "   - Wireguard               : 7070"  | tee -a log-install.txt
echo "   - L2TP/IPSEC VPN          : 1701"  | tee -a log-install.txt
echo "   - PPTP VPN                : 1732"  | tee -a log-install.txt
echo "   - SSTP VPN                : 444"  | tee -a log-install.txt
echo "   - Shadowsocks-R           : 1443-1543"  | tee -a log-install.txt
echo "   - SS-OBFS TLS             : 2443-2543"  | tee -a log-install.txt
echo "   - SS-OBFS HTTP            : 3443-3543"  | tee -a log-install.txt
echo "   - V2RAY Vmess TLS         : 8443"  | tee -a log-install.txt
echo "   - V2RAY Vmess None TLS    : 80"  | tee -a log-install.txt
echo "   - V2RAY Vless TLS         : 2083"  | tee -a log-install.txt
echo "   - V2RAY Vless None TLS    : 8880"  | tee -a log-install.txt
echo "   - Trojan                  : 2087"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   >>> Server Information & Other Features"  | tee -a log-install.txt
echo "   - Timezone                : Asia/Jakarta (GMT +7)"  | tee -a log-install.txt
echo "   - Fail2Ban                : [ON]"  | tee -a log-install.txt
echo "   - Dflate                  : [ON]"  | tee -a log-install.txt
echo "   - IPtables                : [ON]"  | tee -a log-install.txt
echo "   - Auto-Reboot             : [ON]"  | tee -a log-install.txt
echo "   - IPv6                    : [OFF]"  | tee -a log-install.txt
echo "   - Autoreboot On 05.00 GMT +7" | tee -a log-install.txt
echo "   - Autobackup Data" | tee -a log-install.txt
echo "   - Restore Data" | tee -a log-install.txt
echo "   - Auto Delete Expired Account" | tee -a log-install.txt
echo "   - Full Orders For Various Services" | tee -a log-install.txt
echo "   - White Label" | tee -a log-install.txt
echo "   - Installation Log --> /root/log-install.txt"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   - Dev/Main                : Seno Wahyu Hidayat"  | tee -a log-install.txt
echo "   - Telegram                : T.me/senowahyu62"  | tee -a log-install.txt
echo "   - Instagram               : @senowahyu62"  | tee -a log-install.txt
echo "   - Whatsapp                : 082220155143"  | tee -a log-install.txt
echo "   - Facebook                : -" | tee -a log-install.txt
echo "------------------Script Created By Seno Wahyu Hidayat-----------------" | tee -a log-install.txt
echo ""
clear
echo " Rebooting"
sleep 3
rm -f setup.sh
reboot


