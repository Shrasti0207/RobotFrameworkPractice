*** Settings ***
Library           SeleniumLibrary
Resource          ../Resources/RegisterKeywords.robot

*** Variables ***
${BROWSER}        Chrome
${BASE_URL}       https://demo.nopcommerce.com/
${EXPECTED_TITLE}  nopCommerce demo store. Home page title
${RegisterLogoText}  Register
${FirstName}      Jane
${LastName}       Doe
${Password}       Password123
${registrationSuccessMessageText}    Your registration completed

*** Test Cases ***
Verify Registration Page Title
    ${Email}        Evaluate    "user" + str(random.randint(1000,9999)) + "@gmail.com"    random
    Log To Console    Generated Email: ${Email}
    Go To website Page and verify the title    ${BASE_URL}    ${BROWSER}    ${EXPECTED_TITLE}
    Go To Registration Page    ${RegisterLogoText}
    Registration User Details    ${FirstName}    ${LastName}    ${Email}    ${Password}    ${Password}    ${registrationSuccessMessageText} 
    Close the Browser  