*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}        https://automationexercise.com/login
${BROWSER}    chrome
${EMAIL}      Catrtx8080@GGmail.com
${PASSWORD}   123456

*** Test Cases ***
Login With Valid Credentials
    [Documentation]    เปิดเว็บ Login แล้วกรอกข้อมูลเข้าสู่ระบบด้วยข้อมูลใหม่
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Input Text    xpath=//input[@data-qa='login-email']    ${EMAIL}
    Input Text    xpath=//input[@data-qa='login-password']    ${PASSWORD}
    Click Button    xpath=//button[@data-qa='login-button']
    Wait Until Page Contains Element    xpath=//a[contains(text(),'Logged in as')]    timeout=15s
    Page Should Contain Element    xpath=//a[contains(text(),'Logged in as')]
    Capture Page Screenshot    Screenshots/screen-login-empty-email-${TEST NAME}.png

    Close Browser
   