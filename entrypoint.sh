#!/bin/sh

# Create nut run directory
mkdir -p /var/run/nut
mkdir -p /run/nut

# Change perms of nut run dirs
chown -R nut:nut /run/nut /var/run/nut

# Start the drivers as the nut user
/usr/sbin/upsdrvctl -u nut start

# Start the UPSD as nut
/usr/sbin/upsd -u nut

# start UPSMon
/usr/sbin/upsmon

# Start upslog and log to stdout
/usr/bin/upslog  -l -  -f "%TIME @Y@m@dT@T% %UPSHOST% [%VAR ups.status%] %VAR battery.charge%%% %VAR battery.voltage% %VAR input.voltage%Vin %VAR input.current%Ain %VAR input.frequency%Hz-in %VAR output.voltage%Vout %VAR output.current%Aout %VAR output.frequency%Hz-out" -s cabinet1 -i 60
