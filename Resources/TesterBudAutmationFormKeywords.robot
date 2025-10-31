*** Settings ***
Library           SeleniumLibrary
Variables          ../PageObjects/TesterbudPage.py
Resource     ../Resources/RegisterKeywords.robot
Resource     ../Resources/TesterbudKeywords.robot

*** Variables ***
${BROWSER}        Chrome
${BASE_URL}       https://testerbud.com/
${EXPECTED_TITLE}  TesterBud - Best Demo Website for Automation Testing | Practice & Learn

*** Keywords ***

Open Application
    Go To website Page and verify the title    ${BASE_URL}    ${BROWSER}    ${EXPECTED_TITLE}

Select Country of Residence
    [Arguments]    ${country}
    Wait Until Element Is Visible    ${selectCountryDropdownLocator}    10s
    Select From List By Label    ${selectCountryDropdownLocator}    ${country}

Select Title
    [Arguments]    ${title}
    Wait Until Element Is Visible    ${selectTitleDropdownLocator}    10s
    Select From List By Label    ${selectTitleDropdownLocator}    ${title}

Input Firstname and Lastname
    [Arguments]    ${firstname}    ${lastname}
    Wait Until Element Is Visible    ${firstNameInput}    10s
    Input Text    ${firstNameInput}    ${firstname}
    Input Text    ${lastNameInput}    ${lastname}

Select Date of Birth
    [Arguments]    ${dob}
    Wait Until Element Is Visible    ${dobInput}    10s
    Input Text    ${dobInput}    ${dob}
    Scroll Element Into View    ${submitButton}

Input Email
    [Arguments]    ${email}
    Wait Until Element Is Visible    ${dateOfJoiningInput}    10s
    Click Element    ${dateOfJoiningInput}    
    Wait Until Element Is Visible    ${emailInput}    10s
    Input Text    ${emailInput}    ${email}

Input Phone Number
    [Arguments]    ${phone_extension}    ${phone_number}
    Wait Until Element Is Visible    ${phoneNumberExtensionDropdown}    10s
    Select From List By Label    ${phoneNumberExtensionDropdown}    ${phone_extension}
    Input Text    ${phoneNumberInput}    ${phone_number}

Select Communication Method By Email Radio Button
    Wait Until Element Is Visible    ${emailRadioButton}    10s
    Click Element    ${emailRadioButton}

Input Date Of joining
    [Arguments]    ${doj}
    Wait Until Element Is Visible    ${dateOfJoiningInput}    10s
    Input Text    ${dateOfJoiningInput}    ${doj}

Submit the form
    Wait Until Element Is Visible    ${submitButton}    10s
    Click Button    ${submitButton}

Go to Web Form Automation Page
    Wait Until Element Is Visible    ${webFormAutomationLink}
    Click Element    ${webFormAutomationLink}
    Element Should Be Visible    ${automateWebFormText}

Close all Browser
    Close All Browsers



