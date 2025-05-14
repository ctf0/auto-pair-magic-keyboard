@echo off
echo %DATE% %TIME% - USB hub disconnected >> ".\usb_events.log"

btpair -u -b 68:FE:F7:7B:53:BC