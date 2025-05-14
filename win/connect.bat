@echo off
echo %DATE% %TIME% - USB hub connected >> ".\usb_events.log"

btcom -c -b 68:FE:F7:7B:53:BC -s 1124