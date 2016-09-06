*** Settings ***

Documentation  A resource file containing the application specific keywords
...            that create our own domain specific language. This resource
...            implements keywords for testing HTML version of the test
...            application.
Library        Selenium2Library
Library        ScreenCapture.py


*** Variables ***

${SERVER}        10.1.23.114/bookstore/
${BROWSER}       firefox
${DELAY}         0
${VALID USER}    admin
${VALID PASSWD}  admin
${LOGIN URL}     http://${SERVER}/Login.aspx


*** Keywords ***

Open Browser To Login Page
    Open Browser  ${LOGIN URL}  ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed  ${DELAY}
    Title Should Be  Book Store

Go To Login Page
    Go To  ${LOGIN URL}
    Title Should Be  Book Store

Input Username  [Arguments]  ${username}
    Input Text  id=Login_name  ${username}

Input Password  [Arguments]  ${password}
    Input Text  id=Login_password  ${password}

Submit Credentials
    Click Button  id=Login_login

Login With Valid Credentials    [Arguments]  ${username}    ${password}
    Input Text  id=Login_name  ${username}
    Input Text  id=Login_password  ${password}