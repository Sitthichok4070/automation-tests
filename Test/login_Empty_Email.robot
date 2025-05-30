*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}        https://automationexercise.com/login
${BROWSER}    chrome
${PASSWORD}   123456

*** Test Cases ***
Login With Empty Email
    [Documentation]    ทดสอบ Login ด้วยช่องอีเมลเว้นว่าง ระบบต้องแจ้งเตือน
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Input Text    xpath=//input[@data-qa='login-password']    ${PASSWORD}
    Click Button    xpath=//button[@data-qa='login-button']
    # Browser จะขึ้น popup "Please fill out this field." อัตโนมัติ ไม่เปลี่ยนหน้า
    Page Should Contain    Login to your account
    Capture Page Screenshot    Screenshots/screen-login-empty-email-${TEST NAME}.png
    Close Browser
