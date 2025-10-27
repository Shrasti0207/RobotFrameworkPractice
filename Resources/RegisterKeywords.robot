*** Settings ***
Library           SeleniumLibrary
Variables    ../PageObjects/RegistrationPage.py


*** Keywords ***
Go To website Page and verify the title
    [Arguments]    ${url}    ${browser}    ${expectedTitle}
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    ${title}=    Get Title
    Should Be Equal    ${title}    ${expectedTitle}

Go To Registration Page
    [Arguments]    ${RegisterLogoText}
    Wait Until Element Is Visible    ${registrationLink}    10s   
    Click Link    ${registrationLink}
    Wait Until Element Is Visible    ${registerLogo}
    ${regTitle}=    Get Text    ${registerLogo}
    Should Be Equal    ${regTitle}    ${RegisterLogoText}

Registration User Details
    [Arguments]    ${FirstName}    ${LastName}    ${Email}    ${Password}    ${ConfirmPassword}    ${registrationSuccessMessageText}
    Wait Until Element Is Visible    ${genderFemaleRadioButton}    10s
    Click Button    ${genderFemaleRadioButton}
    Wait Until Element Is Visible    ${firstNameInput}    10s
    Input Text    ${firstNameInput}    ${FirstName}
    Input Text    ${lastNameInput}    ${LastName}
    Input Text    ${emailIdInput}    ${Email}
    Input Text    ${passwordInput}    ${Password}
    Input Text    ${confirmPasswordInput}    ${ConfirmPassword}
    Click Button    ${registerButton}
    Wait Until Element Is Visible    ${registrationSuccessMessage}    10s
    ${resultText}=    Get Text    ${registrationSuccessMessage}
    Should Contain    ${resultText}    ${registrationSuccessMessageText}

Close the Browser
    Close All Browsers


