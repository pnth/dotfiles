#!/bin/bash
sudo rfkill unblock all
connmanctl enable bluetooth
sudo hciconfig hci0 up

