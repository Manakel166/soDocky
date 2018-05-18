#!/bin/bash
echo "{
	\"capabilities\":
		[
			{
				\"browserName\": \"Android_Local_Device\",
  				\"device\": \"Android_Local_Device\",
  				\"version\": 4.0,
  				\"maxInstances\": 1,
				\"platform\":\"ANDROID\",
				\"automationName\":\"UiAutomator\"
			}
		],
	\"configuration\":
	{
		\"cleanUpCycle\":2000,
		\"timeout\":30000,
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
xfce4-terminal -H -e './start_selenium_hub.sh' 

cd /headless/Desktop/automation/eclipse
xfce4-terminal --title=EclipseRed -e './RED'

cd /headless/Desktop/automation/appium
appium --nodeconfig nodeconfig.json




