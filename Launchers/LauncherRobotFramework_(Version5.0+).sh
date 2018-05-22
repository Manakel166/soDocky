#!/bin/bash
echo "{
	\"capabilities\":
		[
			{
				\"browserName\": \"Android_Local_Device\",
  				\"device\": \"Android_Local_Device\",
  				\"version\": 5.0,
  				\"maxInstances\": 1,
				\"platform\":\"ANDROID\",
				\"automationName\":\"UiAutomator2\"
			}
		],
	\"configuration\":
	{
		\"cleanUpCycle\":2000,
		\"timeout\":30,
		\"maxSession\": 1,
		\"proxy\":\"org.openqa.grid.selenium.proxy.DefaultRemoteProxy\",
		\"register\": true,
		\"registerCycle\": 5000,
		\"host\": \"127.0.0.1\",
		\"port\": 4723,
		\"hubPort\": 4442,
		\"hubHost\": \"127.0.0.1\"
	}
}" > /headless/Desktop/automation/appium/nodeconfig.json

#recup $version
# créer le json

cd /headless/Desktop/automation/selenium
xfce4-terminal -H -e './start_selenium_hub.sh' --tab -x 'ride.py'

cd /headless/Desktop/automation/appium
appium --nodeconfig nodeconfig.json
