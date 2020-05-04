#!/bin/bash

# you must use with sudo

if [[ $1 == "-on" ]]; then
        # query for the public ip
		firstip=$(dig +short myip.opendns.com @resolver1.opendns.com)
		# start tunnel
		printf "\t will start the tunnel now\n"
		protonvpn c
		# query for the public ip
		printf "\t query for the new ip. It should not match the one shown before\n"
		vpnip=$(dig +short myip.opendns.com @resolver1.opendns.com)
			if [ $firstip == $vpnip ]; then
				printf "Your VPN connection is disabled. First ip '$firstip' VPN ip '$vpnip'\n"
			else
				printf "Your vpn connection is now enabled. First ip '$firstip' VPN ip '$vpnip'\n"
			fi
elif [[ $1 == "-off" ]]; then
        # query for the public ip
		firstip=$(dig +short myip.opendns.com @resolver1.opendns.com)
		# stop tunnel
		printf "\t will stop the tunnel now\n"
		protonvpn d
		# query for the public ip
		printf "\t query for the new ip. It should not match the one shown before\n"
		vpnip=$(dig +short myip.opendns.com @resolver1.opendns.com)
			if [ $firstip == $vpnip ]; then
				printf "Your VPN connection is still enabled. First ip '$firstip' VPN ip '$vpnip'\n"
			else
				printf "Your vpn connection is now disabled. First ip '$firstip' VPN ip '$vpnip'\n"
			fi
elif [[ $1 == "-reconnect" ]]; then
        # query for the public ip
		firstip=$(dig +short myip.opendns.com @resolver1.opendns.com)
		# start tunnel
		printf "\t will start the tunnel now\n"
		protonvpn r
		# query for the public ip
		printf "\t query for the new ip. It should not match the one shown before\n"
		vpnip=$(dig +short myip.opendns.com @resolver1.opendns.com)
			if [ $firstip == $vpnip ]; then
				printf "Your VPN connection is disabled. First ip '$firstip' VPN ip '$vpnip'\n"
			else
				printf "Your vpn connection is now enabled. First ip '$firstip' VPN ip '$vpnip'\n"
			fi
else    
        echo "no option was selected. Please use -on to connect the VPN, -off to disconnect the VPN or -reconnect to reconnect to the last VPN server"
fi
