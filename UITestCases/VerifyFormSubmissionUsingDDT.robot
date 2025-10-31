*** Settings ***
Library           SeleniumLibrary
Resource          ../Resources/TesterBudAutmationFormKeywords.robot
Library           DataDriver    ../TestData/automationFormData.csv

Suite Setup       Open Application
Suite Teardown    Close all Browser
Test Template     Verify Form Submission With Multiple Data Sets

*** Test Cases ***
Form Submission With Multiple Data Sets from excel     using     ${firstname} ${lastname}   ${country}    ${title}    ${dob}    ${email}    ${phone_extension}    ${phone_number}    ${doj}

*** Keywords ***
Verify Form Submission With Multiple Data Sets
    [Arguments]    ${firstname}    ${lastname}     ${country}    ${title}    ${dob}    ${email}    ${phone_extension}    ${phone_number}    ${doj}
    Go to TesterBud Practicesites Toggle Menu
    Go to Web Form Automation Page
    Select Country of Residence    ${country}
    Select Title    ${title}
    Input Firstname and Lastname    ${firstname}    ${lastname}
    Select Date of Birth    ${dob}
    Input Email    ${email}
    Input Phone Number    ${phone_extension}    ${phone_number}
    Select Communication Method By Email Radio Button
    Input Date Of joining    ${doj}
    Submit the form

       

    