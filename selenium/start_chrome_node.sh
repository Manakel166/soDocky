java -Dwebdriver.chrome.driver=/headless/Desktop/automation/selenium/chromedriver -jar selenium-server-standalone.jar -port 5556 -role node -hub http://localhost:4444/grid/register -nodeConfig node_Chrome.json