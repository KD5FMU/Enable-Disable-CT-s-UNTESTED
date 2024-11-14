#!/bin/bash
# Path to your AllStarLink configuration
AST_CFG='/etc/asterisk'

# Disable all courtesy tones (local and remote)
sudo sed -i 's/^telemdefault=2/telemdefault=0/g' $AST_CFG/rpt.conf
sudo sed -i 's/^telemdynamic=1/telemdynamic=0/g' $AST_CFG/rpt.conf

# Set repeater hangtime to 250ms
sudo sed -i 's/^hangtime=1000/hangtime=250/g' $AST_CFG/rpt.conf

# Restart asterisk to apply changes
sudo asterisk -rx "module reload"
echo "Courtesy tones disabled and hangtime set to 250ms."
