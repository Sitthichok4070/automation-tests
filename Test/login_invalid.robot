*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}         https://automationexercise.com/login
${BROWSER}     chrome

*** Test Cases ***
Login With Invalid Credentials
    [Documentation]    ทดสอบ Login ด้วยอีเมล/รหัสผ่านผิด ระบบต้องแสดง error message
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Input Text    xpath=//input[@data-qa='login-email']    wrong_email@example.com
    Input Text    xpath=//input[@data-qa='login-password']    wrongpassword123
    Click Button    xpath=//button[@data-qa='login-button']
    Wait Until Page Contains Element    xpath=//p[contains(text(),'Your email or password is incorrect!')]    timeout=10s
    Page Should Contain Element    xpath=//p[contains(text(),'Your email or password is incorrect!')]
    Capture Page Screenshot    Screenshots/screen-login-empty-email-${TEST NAME}.png
    Close Browser

