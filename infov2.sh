#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- icanhazip.com);
echo "Checking VPS"
IZIN=$( curl -Ls https://raw.githubusercontent.com/senowahyu62/izin/main/ip | grep $MYIP )
if [ $MYIP = $IZIN ]; then
echo -e "${green}Permission Accepted...${NC}"
else
echo -e "${red}Permission Denied!${NC}";
echo "Only For Premium Users"
exit 0
fi

clear
#SETUP String
HIJAU='\033[1;32m'
MERAH='\033[1;31m'
BGMERAH="\e[48;5;160m"
BGNC="\e[0m"
NC='\033[0m'
LAYANANKU="v2ray.service v2ray@none.service v2ray@vless v2ray@vnone.service trojan xl2tpd.service pptpd.service accel-ppp.service stunnel4.service wg-quick@wg0 ssrmu.service shadowsocks-libev.service"
BORDER="${BGMERAH}                 "
TUTUP_BORDER="                 ${BGNC}"



#Fungsi , UNTUK CEK LAYANAN BERJALAN/TIDAK BERJALAN
CEK_STATUS(){
CEK="$(systemctl status $sayang | grep Active | grep Active | cut -d ' ' -f 6)";
if [ "$CEK" == "(running)" ] || [ "$CEK" == "(exited)" ]
then
Warna="$HIJAU		: Running $NC";
else
Warna="$MERAH		: Stoped $NC";
fi
}


#Fungsi , UNTUK CEK NAMA
CEK_NAMA(){
if [ "$sayang" == "v2ray.service" ]
then
NAMA_LAYANAN="Vmess TlS"
elif [ "$sayang" == "v2ray@none.service" ]
then
NAMA_LAYANAN="Vmess Non-TlS"
elif [ "$sayang" == "v2ray@vless" ]
then
NAMA_LAYANAN="VLess TlS"
elif [ "$sayang" == "v2ray@vnone.service" ]
then
NAMA_LAYANAN="VLess Non-TlS"
elif [ "$sayang" == "trojan" ]
then
NAMA_LAYANAN="Trojan Service"
elif [ "$sayang" == "xl2tpd.service" ]
then
NAMA_LAYANAN="L2TP Service"
elif [ "$sayang" == "pptpd.service" ]
then
NAMA_LAYANAN="PPTP Service"
elif [ "$sayang" == "accel-ppp.service" ]
then
NAMA_LAYANAN="SSTP Service"
elif [ "$sayang" == "stunnel4.service" ]
then
NAMA_LAYANAN="SSH/OVPN"
elif [ "$sayang" == "wg-quick@wg0" ]
then
NAMA_LAYANAN="Wireguard"
elif [ "$sayang" == "ssrmu.service" ]
then
NAMA_LAYANAN="ShadowsockR"
elif [ "$sayang" == "shadowsocks-libev.service" ]
then
NAMA_LAYANAN="ShadowsockS"
else
        exit 0
fi
}

#JUDUL , UNTUK MENAMPILKAN JUDUL
printf "${BORDER}STATUS LAYANAN${TUTUP_BORDER}\n";



#PROSES PERULANGAN UNUTUK CEK STATUS LAYANAN
for sayang in $LAYANANKU
do
    CEK_STATUS;
    CEK_NAMA;
	printf "${NAMA_LAYANAN}${Warna}\n";
done



#JUDUL
#printf "${BORDER}  Server Port  ${TUTUP_BORDER}\n";
#cat ~/log-install.txt | sed -n '6,24p;25q' | sed 's/   - //'

