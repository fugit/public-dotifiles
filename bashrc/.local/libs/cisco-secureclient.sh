#!/bin/bash

# not really great but maybe with short sleep it wil work.
# Launch vpnagentd if not running
sudo /opt/cisco/secureclient/bin/vpnagentd

sleep 3
# Launch vpnui
/opt/cisco/secureclient/bin/vpnui
