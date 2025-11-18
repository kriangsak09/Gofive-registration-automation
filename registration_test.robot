*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}          https://uat.tks.co.th/ClientPortal/Register/empeo
${PHONE}        0967690708
${OTP}          123456
${PROMO}        FREE15DAY

*** Test Cases ***
TC01 Register Successful
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    # Scroll ให้ element เห็นบนหน้าจอ
    Scroll Element Into View    xpath=//input[@placeholder='กรอกเลขประจำตัวผู้เสียภาษี หรือ ชื่อบริษัท']
    # กรอกเลขประจำตัวผู้เสียภาษี
    Input Text    xpath=//input[@placeholder='กรอกเลขประจำตัวผู้เสียภาษี หรือ ชื่อบริษัท']    1234567890


    # เลือก dropdown 
    Scroll Element Into View    xpath=//div[contains(@class,'go5-dropdown-selection-value-placeholder') and contains(text(),'ประเภทธุรกิจ*')]
    Click Element    xpath=//div[contains(@class,'go5-dropdown-selection-value-placeholder') and contains(text(),'ประเภทธุรกิจ*')]

    Scroll Element Into View    xpath=//div[contains(text(),'ซอฟต์แวร์ การพัฒนาแอพ')]
    Click Element    xpath=//div[contains(text(),'ซอฟต์แวร์ การพัฒนาแอพ')]

    Scroll Element Into View    xpath=//div[contains(@class,'go5-dropdown-selection-value-placeholder') and contains(text(),'ผู้ใช้งาน*')]
    Click Element    xpath=//div[contains(@class,'go5-dropdown-selection-value-placeholder') and contains(text(),'ผู้ใช้งาน*')]

    Scroll Element Into View    xpath=//p[contains(@class,'go5-dropdown-item-label') and contains(text(),'1-20')]
    Click Element    xpath=//p[contains(@class,'go5-dropdown-item-label') and contains(text(),'1-20')]
    
    # Scroll ให้ element เห็นบนหน้าจอ
    Scroll Element Into View    xpath=//input[@placeholder='อีเมล*']
    # กรอก Email
    Input Text    xpath=//input[@placeholder='อีเมล*']    testuser@example.com
    Input Text    xpath=//input[@placeholder='ชื่อ*']    Test
    Input Text    xpath=//input[@placeholder='นามสกุล*']     User
    Input Text    id=phone         ${PHONE}
    Scroll Element Into View    xpath=//span[contains(@class,'got-coupon')]
    Click Element    xpath=//span[contains(@class,'got-coupon')]
    Input Text    xpath=//input[@placeholder='รหัสส่วนลด']    ${PROMO}
   # Scroll ให้ checkbox เห็นบนหน้าจอ
    Scroll Element Into View    css=[data-testid="input_checkbox_registration_checkbox"]
    
    # รอให้ checkbox พร้อมคลิก
    Wait Until Element Is Visible    css=[data-testid="input_checkbox_registration_checkbox"]    10s
    Wait Until Element Is Enabled    css=[data-testid="input_checkbox_registration_checkbox"]    10s

    # คลิก checkbox
    Click Element    css=[data-testid="input_checkbox_registration_checkbox"]
    Scroll Element Into View    xpath=//button[@type='submit' and contains(@class,'go5-button')]
    Click Element    xpath=//button[@type='submit' and contains(@class,'go5-button')]
    Close Browser

TC02 Registration Empty Required Fields
    # ตรวจสอบกรณีที่ไม่กรอกข้อมูล required fields
    Open Browser    ${URL}    chrome
    Maximize Browser Window

    # Scroll ให้ checkbox เห็นบนหน้าจอ
    Scroll Element Into View    css=[data-testid="input_checkbox_registration_checkbox"]
    
    # รอให้ checkbox พร้อมคลิก
    Wait Until Element Is Visible    css=[data-testid="input_checkbox_registration_checkbox"]    10s
    Wait Until Element Is Enabled    css=[data-testid="input_checkbox_registration_checkbox"]    10s

    # คลิก checkbox
    Click Element    css=[data-testid="input_checkbox_registration_checkbox"]

    # คลิกปุ่ม Submit
    Scroll Element Into View    xpath=//button[@type='submit' and contains(@class,'go5-button')]
    Click Element    xpath=//button[@type='submit' and contains(@class,'go5-button')]

 

    # ตรวจสอบ error message ว่าปรากฏ
    Wait Until Element Is Visible    xpath=//p[contains(normalize-space(.), 'กรุณากรอกเลขประจำตัวผู้เสียภาษีหรือชื่อบริษัท')]    15s
    Element Should Be Visible    xpath=//p[contains(normalize-space(.), 'กรุณากรอกเลขประจำตัวผู้เสียภาษีหรือชื่อบริษัท')]

    Close Browser

TC03 Registration Invalid 
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    # Scroll ให้ element เห็นบนหน้าจอ
    Scroll Element Into View    xpath=//input[@placeholder='กรอกเลขประจำตัวผู้เสียภาษี หรือ ชื่อบริษัท']
    # กรอกเลขประจำตัวผู้เสียภาษี
    Input Text    xpath=//input[@placeholder='กรอกเลขประจำตัวผู้เสียภาษี หรือ ชื่อบริษัท']    1234567899


    # เลือก dropdown 
    Scroll Element Into View    xpath=//div[contains(@class,'go5-dropdown-selection-value-placeholder') and contains(text(),'ประเภทธุรกิจ*')]
    Click Element    xpath=//div[contains(@class,'go5-dropdown-selection-value-placeholder') and contains(text(),'ประเภทธุรกิจ*')]

    Scroll Element Into View    xpath=//div[contains(text(),'ซอฟต์แวร์ การพัฒนาแอพ')]
    Click Element    xpath=//div[contains(text(),'ซอฟต์แวร์ การพัฒนาแอพ')]

    Scroll Element Into View    xpath=//div[contains(@class,'go5-dropdown-selection-value-placeholder') and contains(text(),'ผู้ใช้งาน*')]
    Click Element    xpath=//div[contains(@class,'go5-dropdown-selection-value-placeholder') and contains(text(),'ผู้ใช้งาน*')]

    Scroll Element Into View    xpath=//p[contains(@class,'go5-dropdown-item-label') and contains(text(),'1-20')]
    Click Element    xpath=//p[contains(@class,'go5-dropdown-item-label') and contains(text(),'1-20')]
    
    # Scroll ให้ element เห็นบนหน้าจอ
    Scroll Element Into View    xpath=//input[@placeholder='อีเมล*']
    # กรอก Email
    Input Text    xpath=//input[@placeholder='อีเมล*']    testuser@example.com
    Input Text    xpath=//input[@placeholder='ชื่อ*']    Test
    Input Text    xpath=//input[@placeholder='นามสกุล*']     User
    Input Text    id=phone         0895478395
    Scroll Element Into View    xpath=//span[contains(@class,'got-coupon')]
    Click Element    xpath=//span[contains(@class,'got-coupon')]
    Input Text    xpath=//input[@placeholder='รหัสส่วนลด']    ERRORCODE
   # Scroll ให้ checkbox เห็นบนหน้าจอ
    Scroll Element Into View    css=[data-testid="input_checkbox_registration_checkbox"]
    
    # รอให้ checkbox พร้อมคลิก
    Wait Until Element Is Visible    css=[data-testid="input_checkbox_registration_checkbox"]    10s
    Wait Until Element Is Enabled    css=[data-testid="input_checkbox_registration_checkbox"]    10s

    # คลิก checkbox
    Click Element    css=[data-testid="input_checkbox_registration_checkbox"]
    Scroll Element Into View    xpath=//button[@type='submit' and contains(@class,'go5-button')]
    Click Element    xpath=//button[@type='submit' and contains(@class,'go5-button')]

    # รอ error message ปรากฏ
    Wait Until Element Is Visible    xpath=//p[contains(normalize-space(.), 'ไม่พบบริษัทที่คุณค้นหา')]    10s
    Element Should Be Visible    xpath=//p[contains(normalize-space(.), 'ไม่พบบริษัทที่คุณค้นหา')]

    Close Browser

*** Test Cases ***
TC04 Apply Promo Code Invalid 
    Open Browser    ${URL}    chrome
    Maximize Browser Window    
    # เปิดหน้าจอส่วนที่มีโค้ดส่วนลดแล้ว scroll ให้เห็น
    Scroll Element Into View    xpath=//span[contains(@class,'got-coupon')]
    Click Element    xpath=//span[contains(@class,'got-coupon')]

    # กรอกโค้ดส่วนลด
    Input Text    xpath=//input[@placeholder='รหัสส่วนลด']    INVALIDCODE

    # กดปุ่ม "ใช้โค้ด"
    Scroll Element Into View    xpath=//p[contains(@class,'btn-light-noborder') and contains(text(),'ใช้โค้ด')]
    Click Element    xpath=//p[contains(@class,'btn-light-noborder') and contains(text(),'ใช้โค้ด')]


    # รอ error message ปรากฏ
    Wait Until Element Is Visible    xpath=//p[contains(normalize-space(.), 'คูปองโค้ดไม่ถูกต้อง')]    10s
    Element Should Be Visible    xpath=//p[contains(normalize-space(.), 'คูปองโค้ดไม่ถูกต้อง')]

    Close Browser

TC05 Registration Invalid Format (Email, Phone)
    #ทดสอบกรอก Email และเบอร์มือถือผิดรูปแบบ
    Open Browser    ${URL}    chrome
    Maximize Browser Window  

    # กรอก Email และเบอร์ผิดรูปแบบ
    Scroll Element Into View    xpath=//input[@placeholder='อีเมล*']
    Input Text    xpath=//input[@placeholder='อีเมล*']    invalid-email
    Input Text    id=phone    123451557489

    # กดปุ่ม Submit
    Scroll Element Into View    xpath=//button[@type='submit' and contains(@class,'go5-button')]
    Click Element    xpath=//button[@type='submit' and contains(@class,'go5-button')]

    # ตรวจสอบข้อความ error ของ Email และ Phone
    Wait Until Element Is Visible    xpath=//p[contains(normalize-space(.), 'กรุณาใส่อีเมลที่ถูกต้อง')]    10s
    Element Should Be Visible    xpath=//p[contains(normalize-space(.), 'กรุณาใส่อีเมลที่ถูกต้อง')]

    Wait Until Element Is Visible    xpath=//p[contains(normalize-space(.), 'รูปแบบเบอร์โทรศัพท์ไม่ถูกต้อง')]    10s
    Element Should Be Visible    xpath=//p[contains(normalize-space(.), 'รูปแบบเบอร์โทรศัพท์ไม่ถูกต้อง')]


    Close Browser