*** Settings ***
Library           SeleniumLibrary
Resource          ../Resources/RegisterKeywords.robot
Resource          ../Resources/TesterbudKeywords.robot

*** Variables ***
${BROWSER}        Chrome
${BASE_URL}       https://testerbud.com/
${EXPECTED_TITLE}  TesterBud - Best Demo Website for Automation Testing | Practice & Learn

*** Test Cases ***
Validate Multiple Links on a Page
    Go To website Page and verify the title    ${BASE_URL}    ${BROWSER}    ${EXPECTED_TITLE}
    Go to TesterBud Practicesites Toggle Menu
    Verify all links are working
    Close the Browser