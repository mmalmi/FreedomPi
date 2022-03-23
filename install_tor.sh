#!/bin/bash
# Based on Adafruit Learning Technologies Onion Pi project
# More info: http://learn.adafruit.com/onion-pi

if (( $EUID != 0 )); then
  echo "This must be run as root. Type in 'sudo bash $0' to run it as root."
  exit 1
fi

echo "$(tput setaf 2)                          
                   ..         
                  ,:          
          .      ::           
          .:    :2.           
           .:,  1L            
            .v: Z, ..::,      
             :k:N.Lv:         
              22ukL           
              JSYk.$(tput bold ; tput setaf 7)           
             ,B@B@i           
             BO@@B@.          
           :B@L@Bv:@7         
         .PB@iBB@  .@Mi       
       .P@B@iE@@r  . 7B@i     
      5@@B@:NB@1$(tput setaf 5) r  ri:$(tput bold ; tput setaf 7)7@M    
    .@B@BG.OB@B$(tput setaf 5)  ,.. .i, $(tput bold ; tput setaf 7)MB,  
    @B@BO.B@@B$(tput setaf 5)  i7777,    $(tput bold ; tput setaf 7)MB. 
   PB@B@.OB@BE$(tput setaf 5)  LririL,.L. $(tput bold ; tput setaf 7)@P 
   B@B@5iB@B@i$(tput setaf 5)  :77r7L, L7 $(tput bold ; tput setaf 7)O@ 
   @B1B27@B@B,$(tput setaf 5) . .:ii.  r7 $(tput bold ; tput setaf 7)BB 
   O@.@M:B@B@:$(tput setaf 5) v7:    ::.  $(tput bold ; tput setaf 7)BM 
   :Br7@L5B@BO$(tput setaf 5) irL: :v7L. $(tput bold ; tput setaf 7)P@, 
    7@,Y@UqB@B7$(tput setaf 5) ir ,L;r: $(tput bold ; tput setaf 7)u@7  
     r@LiBMBB@Bu$(tput setaf 5)   rr:.$(tput bold ; tput setaf 7):B@i   
       FNL1NB@@@@:   ;OBX     
         rLu2ZB@B@@XqG7$(tput sgr0 ; tput setaf 2)      
            . rJuv::          
                             
            $(tput setaf 2)ONION PI
           $(tput bold ; tput setaf 5)by adafruit. Mainly fixed by Ajani for https://raspberry-pi.fr$(tput sgr0)
"

echo "$(tput setaf 6)This script will auto-setup an Onion Pi Tor proxy for you.$(tput sgr0)"
read -p "$(tput bold ; tput setaf 2)Press [Enter] to begin, [Ctrl-C] to abort...$(tput sgr0)"

echo "$(tput setaf 6)Installing Tor...$(tput sgr0)"
apt-get install tor -y

echo "$(tput setaf 6)Configuring Tor...$(tput sgr0)"
cp /etc/tor/torrc /etc/tor/torrc.bak
echo "Log notice file /var/log/tor/notices.log
VirtualAddrNetwork 10.192.0.0/10
AutomapHostsSuffixes .onion,.exit
AutomapHostsOnResolve 1
TransPort 192.168.4.1:9040
DNSPort 192.168.4.1:53" >> /etc/tor/torrc

echo "$(tput setaf 6)Flushing old IP tables...$(tput sgr0)"
iptables -F
iptables -t nat -F

echo "$(tput setaf 6)Establishing $(tput bold)ssh$(tput sgr0 ; tput setaf 6) exception on port 22...$(tput sgr0)"
iptables -t nat -A PREROUTING -i wlan0 -p tcp --dport 22 -j REDIRECT --to-ports 22

echo "$(tput setaf 6)Rerouting DNS traffic...$(tput sgr0)"
iptables -t nat -A PREROUTING -i wlan0 -p udp --dport 53 -j REDIRECT --to-ports 53

echo "$(tput setaf 6)Rerouting TCP traffic...$(tput sgr0)"
iptables -t nat -A PREROUTING -i wlan0 -p tcp --syn -j REDIRECT --to-ports 9040

echo "$(tput setaf 6)Saving IP tables...$(tput sgr0)"
sh -c "iptables-save > /etc/iptables.ipv4.nat"

echo "$(tput setaf 6)Setting up logging in /var/log/tor/notices.log...$(tput sgr0)"
touch /var/log/tor/notices.log
chown debian-tor /var/log/tor/notices.log
chmod 644 /var/log/tor/notices.log

echo "$(tput setaf 6)Starting Tor...$(tput sgr0)"
service tor start

echo "$(tput setaf 6)Setting Tor to start at boot...$(tput sgr0)"
update-rc.d tor enable

# todo: tor@default.service needs RestartSec=1 or better start sequence. "can't bind to address"

echo "$(tput setaf 6)Setup complete!

$(tput bold)Verify by visiting: $(tput setaf 3)https://check.torproject.org/$(tput sgr0)

$(tput setaf 6)Rebooting$(tput sgr0)..."
reboot

exit 0
