*** SETTINGS ***
Library   funkcjarobot.py
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
  ${RESULT}=   sumowanie stringow   ala   kota
  Should Be Equal   ${RESULT}   alakotaalakota

Uname test
  Connect to local Host
  Input username and password
  Input Command
  Log Out

Test poloczenia internetowego
    Connect to local Host
    Input username and password
    Weryfikacja poloczenia internetowego
    Log Out

Test logowania do poczty wp
  Otworzenie przegldarki Firefox
  Otworzenie strony 1login.wp.pl
  Wpisanie loginu i hasla
  Sprawdzenie czy pojawia sie slowo Odebrane
  Zamkniecie przegladarki


*** Variables ***
${MESSAGE}   This is very first variable
${REMOTEHOST}   127.0.0.1
${USERNAME}   tester
${PASSWORD}   tester
${BROWSER}   Firefox
${VALID USER}   testerwsb_t1
${VALID PASSWORD}   adam1234
${URLWPPOCZTA}   https://profil.wp.pl/login.html?zaloguj=poczta
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

Weryfikacja poloczenia internetowego
  ${wynik}=   Execute Command   ping -q -c1 8.8.8.8
  Should Contain   ${wynik}   1 received
  Should Not Contain   ${wynik}   100% packet loss

Otworzenie przegldarki Firefox
  Open browser   about:blank   ${BROWSER}

Otworzenie strony 1login.wp.pl
  Go To   ${URLWPPOCZTA}

Wpisanie loginu i hasla
  Input text   ${LOGIN}   ${VALID USER}
  Input text   ${PASSWORDWP}   ${VALID PASSWORD}
  Click Element   ${BUTTON}
  Sleep   15

Sprawdzenie czy pojawia sie slowo Odebrane
  Page Should Contain   Odebrane

Zamkniecie przegladarki
  Close All Browsers
