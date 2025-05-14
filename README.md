# Auto pair (Apple Magic keyboard 2) for windows & mac

am using a usb hub to watch its connection status and based on that i connect/disconnect the keyboard.
however the triggers can still be executed manually for both `win & mac`

# Mac:

- install https://folivora.ai/
- install https://github.com/toy/blueutil
- import included [shortcuts](mac) & update the `MAC_ADD`
- add 2 triggers to BTT for when usb hub is connected/disconnected
![btt](mac/btt.png)
- now we have automated the (pair/unpair & connection) on mac

<br>

# Win: (wip)

- install https://bluetoothinstaller.com/bluetooth-command-line-tools
- download https://usbdeview.com/
- follow this [steps](https://superuser.com/a/1742818/864280)
- open `cmd` or `powershell` & run `btdiscovery -s` to get (service UUID & MAC_ADD)
- update the (batch + script files) [here](win) with the correct info you got from previous step

### PS:

for security reasons, the keyboard needs to be paired to windows using a code on first time,  
so unfortently you will have to do it manually using the "Bluetooth > add device" after login.
