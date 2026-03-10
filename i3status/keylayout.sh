#!/bin/bash

while pgrep -x i3>/dev/null; do
	xkblayout-state print %s > /tmp/current-layout
	sleep 1
done
