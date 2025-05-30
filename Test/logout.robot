*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}        https://automationexercise.com/login
${BROWSER}    chrome
${EMAIL}      Catrtx8080@GGmail.com
${PASSWORD}   123456

*** Test Cases ***
Login And Logout
    [Documentation]    ทดสอบ Login และ Logout บน Automation Exercise
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Input Text    xpath=//input[@data-qa='login-email']    ${EMAIL}
    Input Text    xpath=//input[@data-qa='login-password']    ${PASSWORD}
    Click Button    xpath=//button[@data-qa='login-button']
    Wait Until Page Contains Element    xpath=//a[contains(text(),'Logged in as')]    timeout=10s
    Page Should Contain Element    xpath=//a[contains(text(),'Logged in as')]
    Click Element    xpath=//a[@href='/logout']
    Wait Until Page Contains    Login to your account    timeout=10s
    Page Should Contain    Login to your account
    Capture Page Screenshot    Screenshots/screen-login-and-logout-${TEST NAME}.png
    Close Browser

# robot --outputdir Output Test/ เอาไว้เทส
