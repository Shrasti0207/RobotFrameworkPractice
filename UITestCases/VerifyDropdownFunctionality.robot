*** Settings ***
Library           SeleniumLibrary
Resource          ../Resources/RegisterKeywords.robot
Resource          ../Resources/TesterbudKeywords.robot

*** Variables ***
${BROWSER}        Chrome
${BASE_URL}       https://testerbud.com/
${EXPECTED_TITLE}  TesterBud - Best Demo Website for Automation Testing | Practice & Learn

*** Test Cases ***
Verify Dropdown Functionality using Loop
    Go To website Page and verify the title    ${BASE_URL}    ${BROWSER}    ${EXPECTED_TITLE}
    Go to TesterBud Practicesites Toggle Menu
    Verify Dropdown Functionality using Loop
    Close the Browser

