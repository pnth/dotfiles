#!/bin/bash
sleep 4
bluetoothctl << EOF
power on
connect F0:65:DD:BA:37:87
EOF
