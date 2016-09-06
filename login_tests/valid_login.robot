*** Settings ***

Documentation  A test suite with a single test for valid login. This test has
...            a workflow that is created using keywords from the resource file.
Resource       resource.robot


*** Test Cases ***

Valid Login
    Open Browser To Login Page
    Login With Valid Credentials   ${VALID USER}   ${VALID PASSWD}
    Submit Credentials
    Take Snapshot  myimage.jpg
