#!/usr/bin/bash


wg_interface=$(sudo wg)
wg_name="wg-surfshark"
conf_file=$2

case $1 in
    up)
        if [[ -n $wg_interface ]];then
            printf "Existing WireGuard Proton VPN found:\n\n"
            printf "$wg_interface\n\n"

            confirm=""
            read -p "Override? (y/N): " confirm

            if [[ "$confirm" == "y" ]]; then
                if [[ -n $conf_file ]]; then
                    printf "\nOverriding files:"
                    sudo cp $conf_file /etc/wireguard/$wg_name.conf || exit 1
                    printf "\nFile copied: $conf_file\n"
                fi

                printf "\nShutting down existing interface:\n"
                sudo wg-quick down $wg_name

                printf "\nSetting up new server:\n"
                sudo wg-quick up $wg_name

                printf "\nWireGuard interface $wg_name is up\n"
                sudo wg
            fi

        else
            if [[ -n $conf_file ]]; then
                printf "\nOverriding files:"
                sudo cp $conf_file /etc/wireguard/$wg_name.conf || exit 1
                printf "\nFile copied: $conf_file\n"
            fi

            printf "\nSetting up server:\n"
            sudo wg-quick up $wg_name

            printf "\nWireGuard interface ${wg_name} is up\n"
            sudo wg
        fi
        ;;

    down)
        if [[ -n "$wg_interface" ]]; then
            sudo wg-quick down $wg_name
            printf "\nWireGuard interface ${wg_name} removed"
        else
            echo "No WireGuard interface found."
        fi
        ;;

    *)
        echo "Usage: wireguard [up <config-file.conf> | down]"
        ;;
esac
