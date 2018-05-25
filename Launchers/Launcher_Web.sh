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
RobotFrameworkChrome(){
	cd /headless/Desktop/automation/selenium

	#Launch hub selenium and ride
	xfce4-terminal -H -e './start_selenium_hub.sh' --tab -x 'ride.py'

	#Launch selenium node with chromedriver
	./start_chrome_node.sh
		pause
}

# do something in two()
RedChrome(){
	cd /headless/Desktop/automation/eclipse
	xfce4-terminal --title=EclipseRed -e './RED'

	cd /headless/Desktop/automation/selenium
	xfce4-terminal -H -e './start_selenium_hub.sh' 
	
	#Launch selenium node with chromedriver
	./start_chrome_node.sh
		pause
}
 
# do something in three()
RobotFrameworkFirefox(){
	cd /headless/Desktop/automation/selenium

	#Launch hub selenium and ride
	xfce4-terminal -H -e './start_selenium_hub.sh' --tab -x 'ride.py'

	#Launch selenium node with firefox driver
	./start_firefox_node.sh
        pause
}

# do something in four()
RedFirefox(){
	cd /headless/Desktop/automation/eclipse
	xfce4-terminal --title=EclipseRed -e './RED'
	
	cd /headless/Desktop/automation/selenium
	xfce4-terminal -H -e './start_selenium_hub.sh' 

	#Launch selenium node with firefox driver
	./start_firefox_node.sh
		pause
}
 
# function to display menus
show_menus() {
	clear
	echo "~~~~~~~~~~~~~~~~~~~~~"	
	echo " MAIN MENU FOR WEB TESTING"
	echo "                     "
	echo "~~~~~~~~~~~~~~~~~~~~~"
	echo " Testing with CHROME: "
	echo "---------------------"
	echo "1. Launching Robot Framework"
	echo "2. Launching Red"
	echo "                     "
	echo "---------------------"
	echo "                     "
	echo " Testing With FIREFOX: "
	echo "---------------------"
	echo "3. Launching Robot Framework"
	echo "4. Launching Red"
	echo "                     "
	echo "---------------------"
	echo "                     "
	echo "5. Exit"
}

# read input from the keyboard and take a action
# invoke the RobotFrameworkChrome() when the user select 1 from the menu option.
# invoke the RedChrome() when the user select 2 from the menu option.
# invoke the RobotFrameworkFirefox() when the user select 3 from the menu option.
# invoke the RedFirefox() when the user select 4 from the menu option.
# Exit when user the user select 5 form the menu option.
read_options(){
	local choice
	read -p "Enter choice [ 1 - 5] " choice
	case $choice in
		1) RobotFrameworkChrome ;;
		2) RedChrome ;;
		3) RobotFrameworkFirefox ;;
		4) RedFirefox ;;
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