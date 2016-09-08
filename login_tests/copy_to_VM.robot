*** Settings ***
Documentation          This example demonstrates executing commands on a remote machine
...                    and getting their output and the return code.
...
...                    Notice how connections are handled as part of the suite setup and
...                    teardown. This saves some time when executing several test cases.
Library                SSHLibrary
Resource               resource.robot
Suite Setup            Open Connection And Log In
#Suite Teardown         Close all connections

*** Variables ***
${HOST}                10.1.23.114
${USERNAME}            admin
${PASSWORD}            123456
${SOURCE}              C:\\Users\\efarrag\\Desktop\\robot1
${DESTINATION}         \\robot2
${appAddr}              cygwin64\\robot2
${appName}              report.html
${appInputArg}


*** Keywords ***
Open Connection And Log In

   Open Connection    ${HOST}   port=22
   Login    ${USERNAME}    ${PASSWORD}

Copy File
   put directory    ${SOURCE}        ${DESTINATION}      recursive=True

Start Service
    ${cmd} =     set variable  cd\\${appAddr}\\${appName}
    log to console      Going to run command: ${cmd}
    execute command     ${cmd}





*** Test Cases ***
Ex
    Copy File
    Start Service