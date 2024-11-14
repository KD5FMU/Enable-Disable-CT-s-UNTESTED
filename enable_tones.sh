#!/bin/bash
# Path to your AllStarLink configuration
AST_CFG='/etc/asterisk'

# Backup the current configuration
sudo cp $AST_CFG/rpt.conf $AST_CFG/rpt.conf.backup

# Enable all courtesy tones (local and remote)
sudo sed -i 's/^telemdefault=0/telemdefault=2/g' $AST_CFG/rpt.conf
sudo sed -i 's/^telemdynamic=0/telemdynamic=1/g' $AST_CFG/rpt.conf

# Set repeater hangtime to 1000ms
sudo sed -i 's/^hangtime=250/hangtime=1000/g' $AST_CFG/rpt.conf

# Restart asterisk to apply changes
sudo asterisk -rx "module reload"
echo "Courtesy tones enabled and hangtime set to 1000ms."
