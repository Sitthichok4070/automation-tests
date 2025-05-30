*** Settings ***
Library    RequestsLibrary

*** Test Cases ***
Get All Products List
    # สร้าง session ชื่อ 'api' ไปที่ base URL
    Create Session    api    https://automationexercise.com
    # ยิง GET request ไปที่ /api/productsList
    ${resp}=    GET On Session    api    /api/productsList
    # ตรวจสอบว่า status code ที่ได้ = 200 (OK)
    Status Should Be    200    ${resp}
    # Log ข้อมูล json ออกมาดูใน log.html
    Log    ${resp.json()}
# robot --outputdir Output Test/api_test.robot เทส api
