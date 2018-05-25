#!/bin/bash
# A menu driven shell script sample template 
## ----------------------------------
# Step #1: Define variables
# ----------------------------------
EDITOR=vim
PASSWD=/etc/passwd
RED='\033[0;41;30m'
STD='\033[0;0;39m'
 
# ----------------------------------
# Step #2: User defined function
# ----------------------------------
pause(){
  read -p "Thanks for your choice ! Now press [Enter] key to continue..." fackEnterKey
}

# do something in one()
RobotFrameworkV4.0(){
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
		\"timeout\":30,
		\"proxy\":\"org.openqa.grid.selenium.proxy.DefaultRemoteProxy\",
		\"maxSession\": 1,
		\"register\": true,
		\"registerCycle\": 5000,
		\"host\": \"127.0.0.1\",
		\"port\": 4723,
		\"hubPort\": 4442,
		\"hubHost\": \"127.0.0.1\"
	}
}" > /headless/Desktop/automation/appium/nodeconfig.json

	# get the $version
	# create the json

	cd /headless/Desktop/automation/selenium
	xfce4-terminal -H -e './start_selenium_hub.sh' --tab -x 'ride.py'

	cd /headless/Desktop/automation/appium
	appium --nodeconfig nodeconfig.json
		pause
}

# do something in two()
RedV4.0(){
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
		\"timeout\":30,
		\"proxy\":\"org.openqa.grid.selenium.proxy.DefaultRemoteProxy\",
		\"register\": true,
		\"registerCycle\": 5000,
		\"host\": \"127.0.0.1\",
		\"port\": 4723,
		\"hubPort\": 4442,
		\"hubHost\": \"127.0.0.1\"
	}
}" > /headless/Desktop/automation/appium/nodeconfig.json

	# get the $version
	# create the json

	cd /headless/Desktop/automation/selenium
	xfce4-terminal -H -e './start_selenium_hub.sh' 

	cd /headless/Desktop/automation/eclipse
	xfce4-terminal --title=EclipseRed -e './RED'

	cd /headless/Desktop/automation/appium
	appium --nodeconfig nodeconfig.json
		pause
}
 
# do something in three()
RobotFrameworkV5.0(){
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

	# get the $version
	# create the json

	cd /headless/Desktop/automation/selenium
	xfce4-terminal -H -e './start_selenium_hub.sh' --tab -x 'ride.py'

	cd /headless/Desktop/automation/appium
	appium --nodeconfig nodeconfig.json
        pause
}

# do something in four()
RedV5.0(){
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

	# get the $version
	# create le json

	cd /headless/Desktop/automation/selenium
	xfce4-terminal -H -e './start_selenium_hub.sh' 

	cd /headless/Desktop/automation/eclipse
	xfce4-terminal --title=EclipseRed -e './RED'

	cd /headless/Desktop/automation/appium
	appium --nodeconfig nodeconfig.json
		pause
}
 
# function to display menus
show_menus() {
	clear
	echo "~~~~~~~~~~~~~~~~~~~~~"	
	echo " MAIN MENU FOR ANDROID TESTING"
	echo "                     "
	echo "~~~~~~~~~~~~~~~~~~~~~"
	echo " Testing with ANDROID V4.0 and less: "
	echo "---------------------"
	echo "1. Launching Robot Framework"
	echo "2. Launching Red"
	echo "                     "
	echo "---------------------"
	echo "                     "
	echo " Testing With ANDROID V5.0 and more: "
	echo "---------------------"
	echo "3. Launching Robot Framework"
	echo "4. Launching Red"
	echo "                     "
	echo "---------------------"
	echo "                     "
	echo "5. Exit"
}

# read input from the keyboard and take a action
# invoke the RobotFrameworkV4.0() when the user select 1 from the menu option.
# invoke the RedV4.0() when the user select 2 from the menu option.
# invoke the RobotFrameworkV5.0() when the user select 3 from the menu option.
# invoke the RedV5.0() when the user select 4 from the menu option.
# Exit when user the user select 5 form the menu option.
read_options(){
	local choice
	read -p "Enter choice [ 1 - 5] " choice
	case $choice in
		1) RobotFrameworkV4.0 ;;
		2) RedV4.0 ;;
		3) RobotFrameworkV5.0 ;;
		4) RedV5.0 ;;
		5) exit 0;;
		*) echo -e "${RED}Error...choose wisely your option...${STD}" && sleep 2
	esac
}
 
# ----------------------------------------------
# Step #3: Trap CTRL+C, CTRL+Z and quit singles
# ----------------------------------------------
trap '' SIGINT SIGQUIT SIGTSTP
 
# -----------------------------------
# Step #4: Main logic - infinite loop
# ------------------------------------
while true
do
 
	show_menus
	read_options
done