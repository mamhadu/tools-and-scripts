#!/bin/bash

if [ $# -eq 1 ]; then
        while read LINE; do
                ip_address=$(echo $LINE)
                country_data=$(curl -s ipinfo.io/"$ip_address"/country)
                echo ""$ip_address" is from "$country_data"" >> output_list.log
        done < <(cat $1)
else
        echo "\nThe script requires a filename with the list of IP's to be verified"
        echo "\nUsage: ${0} filename"
fi

if [ $# -eq 0 ]; then
        echo "\nPlease follow the usage example"
fi
