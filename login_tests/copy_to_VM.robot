*** Settings ***
Documentation          This example demonstrates executing commands on a remote machine
...                    and getting their output and the return code.
...
...                    Notice how connections are handled as part of the suite setup and
...                    teardown. This saves some time when executing several test cases.

Library                PysphereLibrary
Resource               resource.robot
Suite Setup            Open Connection And Log In
Suite Teardown         Close pysphere Connection

*** Variables ***
${HOST}                Win 8.1 Pro x64 - VM4
${USERNAME}            admin
${PASSWORD}            123456
${SOURCE}              C:\Test\Test.txt
${DESTINATION}         C:\Robot
${PyHOST}              ESX02.STA.COM
${PyUSERNAME}          mayman
${PyPASSWORD}          123@sta.com



*** Keywords ***
Open Connection And Log In
    Open Pysphere Connection  ${PyHOST}  ${PyUSERNAME}  ${PyPASSWORD}


Copy File
    vm login in guest   ${HOST}  ${USERNAME}  ${PASSWORD}
    vm send file    ${HOST}     ${SOURCE}   ${DESTINATION}


*** Test Cases ***
Copying
   Copy File




