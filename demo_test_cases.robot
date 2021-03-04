*** SETTINGS ***
Library   function.py
Library   SSHLibrary
Library   SeleniumLibrary

*** Test Cases ***
first test case in robot
  Log To Console   Show this text

second test case in robot
  Log To Console   ${MESSAGE}

third test case in robot
  First Keyword   Goodbye

Addition testing
  ${RESULT}=   string summing   Hey   Hi   Hello
  Should Be Equal   ${RESULT}   Hey Hi Hello

Uname test
  Connect to local Host
  Input username and password
  Input Command
  Log Out

Internet Connection Test
    Connect to local Host
    Input username and password
    Internet connection verification
    Log Out

WP email login test
  Open Firefox browser
  Open proper website
  Enter login and password
  Check if there is a word: Odebrane
  Close browser


*** Variables ***
${MESSAGE}   This is very first variable
${REMOTEHOST}   127.0.0.1
${USERNAME}   tester
${PASSWORD}   tester
${BROWSER}   Firefox
${VALID USER}   testerwsb_t1
${VALID PASSWORD}   adam1234
${URLWPMAIL}   https://profil.wp.pl/login.html?zaloguj=poczta
${LOGIN}   //*[@id="login"]
${PASSWORDWP}   //*[@id="password"]
${BUTTON}   css:.nSubmit

*** Keywords ***
First Keyword
  [ARGUMENTS]   ${inf}
  Log To Console   ${inf}

Connect to local Host
  Open Connection   ${REMOTEHOST}

Input username and password
  Login   ${USERNAME}   ${PASSWORD}

Input Command
  ${OutPut}=   Execute Command   uname -a
  Should Contain   ${OUTPUT}   GNU/Linux

Log out
  Close All Connections

Internet connection verification
  ${result}=   Execute Command   ping -q -c1 8.8.8.8
  Should Contain   ${result}   1 received
  Should Not Contain   ${result}   100% packet loss

Open Firefox browser
  Open browser   about:blank   ${BROWSER}

Open proper website
  Go To   ${URLWPMAIL}

Enter login and password
  Input text   ${LOGIN}   ${VALID USER}
  Input text   ${PASSWORDWP}   ${VALID PASSWORD}
  Click Element   ${BUTTON}
  Sleep   15

Check if there is a word: Odebrane
  Page Should Contain   Odebrane

Close browser
  Close All Browsers
