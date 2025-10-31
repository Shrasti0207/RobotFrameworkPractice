*** Settings ***
Library           SeleniumLibrary
Variables          ../PageObjects/TesterbudPage.py          

*** Keywords ***
Go to TesterBud Practicesites Toggle Menu
    Wait Until Element Is Visible    ${testerBudLogo}
    Element Should Be Visible    ${testerBudLogo}
    Wait Until Element Is Visible    ${practiveSitesDropdown}
    Click Element    ${practiveSitesDropdown}
    
Verify all links are working
    @{links}=    Get WebElements    ${practiceSitesToggleMenu}
    FOR    ${link}    IN    @{links}
        ${url}=    Get Element Attribute    ${link}    href
        Log    Checking link: ${url}
        Go To    ${url}
        ${title}=    Get Title
        Should Not Be Empty    ${title}
        Go Back
        Wait Until Element Is Visible    ${practiveSitesDropdown}   
        Click Element    ${practiveSitesDropdown}     
    END

Verify Dropdown Functionality using Loop
    Wait Until Element Is Visible    ${webFormAutomationLink}
    Click Element    ${webFormAutomationLink}
    Element Should Be Visible    ${automateWebFormText}
    Wait Until Element Is Visible    ${selectCountryDropdownLocator}
    ${options}=    Get List Items    ${selectCountryDropdownLocator}
    Log Many    ${options}
    Should Not Be Empty    ${options}
    FOR    ${option}    IN    @{options}
        Log To Console    Selecting option: ${option}
        Select From List By Label    ${selectCountryDropdownLocator}    ${option}
        ${selected}=    Get Selected List Label    ${selectCountryDropdownLocator}
        Should Be Equal    ${selected}    ${option}
    END
