#!/bin/bash
REPORT1="https://datastudio.google.com/open/1pWeaaU0j44oLMw3QWb9cmn6WHl8uig41"
REPORT2="https://datastudio.google.com/open/1LC8XmxQva_8J2IbOsiRiAxljEPIOXFMb"
SLEEPTIME=300
BROWSERARGS="--incognito --noerrdialogs --kiosk"

function cleanexit {
	killall chromium-browser
	sed -i 's/"exited_cleanly": false/"exited_cleanly": true/' ~/.config/chromium/Default/Preferences
	sed -i 's/"exited_cleanly":false/"exited_cleanly":true/; s/"exit_type":"[^"]\+"/"exit_type":"Normal"/' ~/.config/chromium/Default/Preferences
}


while true; do
#clean up
cleanexit

#launch first report
chromium-browser $BROWSERARGS $REPORT1 &
sleep $SLEEPTIME
cleanexit

# page 2 abv datastudio
chromium-browser $BROWSERARGS $REPORT2 &
sleep $SLEEPTIME

done
