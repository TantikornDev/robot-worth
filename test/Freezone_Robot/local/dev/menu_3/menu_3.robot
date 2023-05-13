*** Settings ***
Library  SeleniumLibrary

*** Variables ***

# ${URL}                   https://freezoneinventory-dev.azurewebsites.net
${URL}                   https://freezoneinventory-dev.azurewebsites.net/#/dev
${BROWSER}               Chrome
${Submit_Button}         เข้าสู่ระบบ
${robot_login}           3aa94123-01f6-47b8-b5ef-82400f62dccb

*** Keywords ***

Console Check Element

    [Arguments]      ${element}

    Log               Check Element Count: ${element}         console=yes

Open Browser CASHCALL
    
    [Arguments]     ${URL}    ${BROWSER}

    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

    # ${windowhandles}        Get Window Titles

    # Title Should Be    หน้าหลัก | PTTEP

Choose Menu
    [Arguments]     ${menu}

    Page Should Contain Element               ${menu}
    Click Element                             ${menu}

Login In-User 

    Sleep                                     6

    Wait Until Page Contains Element          xpath=//button[@id="onetrust-accept-btn-handler"]

    # ${element_1}         Get Element Count    xpath=//button[@id="onetrust-accept-btn-handler"]
    # Choose Menu                               ${element_1}
    
    Click Element                             xpath=//button[@id="onetrust-accept-btn-handler"]

    Wait Until Page Contains Element          xpath=//select[@id="select_type_login"]
    Click Element                             xpath=//select[@id="select_type_login"]

    Wait Until Page Contains Element          xpath=//option[@id="ad"]
    Click Element                             xpath=//option[@id="ad"]

    Sleep                                     6

    Wait Until Page Contains Element          xpath=//input[@name="loginfmt"]        
    Input Text                                xpath=//input[@name="loginfmt"]            ztantikornp@pttep.com

    Wait Until Page Contains Element          xpath=//input[@id="idSIButton9"]
    Click Element                             xpath=//input[@id="idSIButton9"]

    Sleep                                     2

    Wait Until Page Contains Element          xpath=//input[@name="passwd"]
    Input Text                                xpath=//input[@name="passwd"]             25&Px*tejZBkR9g

    Wait Until Page Contains Element          xpath=//input[@id="idSIButton9"]
    Click Element                             xpath=//input[@id="idSIButton9"]

    Sleep                                     10

    Wait Until Page Contains Element          xpath=//input[@id="idSIButton9"]
    Click Element                             xpath=//input[@id="idSIButton9"]

    Sleep                                     1

Login Ex-User

    Wait Until Page Contains Element          dom:document.querySelector("#rcc-confirm-button")
    Page Should Contain Element               dom:document.querySelector("#rcc-confirm-button")

    ${element_1}         Get Element Count    dom:document.querySelector("#rcc-confirm-button")
    Choose Menu                               ${element_1}
    
    Click Element                             dom:document.getElementById("rcc-confirm-button")

    Wait Until Page Contains Element          xpath=//button[@type="submit"]
    Click Element                             xpath=//button[@type="submit"]

Login

    [Arguments]     ${URL}

    Sleep             3

    ${element_x}    Get Element Count       xpath=//button[@id="onetrust-accept-btn-handler"]
    ${element_0}    Get Element Count       xpath=//input[@id="codeBypass"]
    ${element_1}    Get Element Count       xpath=//button[contains(text(), '${Submit_Button}')]

    Wait Until Page Contains Element        xpath=//button[@id="onetrust-accept-btn-handler"]
    Click Element                           xpath=//button[@id="onetrust-accept-btn-handler"]

    Wait Until Page Contains Element        xpath=//input[@id="codeBypass"]
    Input Text                              xpath=//input[@id="codeBypass"]      ${robot_login}   

    Page Should Contain Element             xpath=//input[@id="codeBypass"]

    ${element_0}    Get Element Count       xpath=//input[@id="codeBypass"]

    Wait Until Page Contains Element        xpath=//button[contains(text(), '${Submit_Button}')]   
    Page Should Contain Element             xpath=//button[contains(text(), '${Submit_Button}')]
    Click Element                           xpath=//button[contains(text(), '${Submit_Button}')]
        
    ${element_1}    Get Element Count       xpath=//button[contains(text(), '${Submit_Button}')]

    Log               Check Function: 2. Login Requestor C2                 console=yes
    Log               Check Element: 'Input Secret Code' ${element_0}       console=yes
    Log               Check Element: 'Login Button' ${element_1}            console=yes

Tab 3 Menu 1

    Sleep                                     1

    Wait Until Page Contains Element          xpath=//span[contains(text(), 'พื้นที่คลังสินค้า')]
    Page Should Contain Element               xpath=//span[contains(text(), 'พื้นที่คลังสินค้า')]
    Click Element                             xpath=//span[contains(text(), 'พื้นที่คลังสินค้า')]

    Wait Until Page Contains Element          xpath=//div/li/a[contains(text(), 'พื้นที่ปลอดภาษี (ระนอง)')]
    Page Should Contain Element               xpath=//div/li/a[contains(text(), 'พื้นที่ปลอดภาษี (ระนอง)')]
    Click Element                             xpath=//div/li/a[contains(text(), 'พื้นที่ปลอดภาษี (ระนอง)')]

    Sleep                                     1

    Scroll Element Into View                  xpath=//span[contains(text(), 'โครงสร้างเว็บไซต์')]

    Sleep                                     1

    #tab: Ground
    Wait Until Page Contains Element          xpath=//button[contains(text(), 'FZ-Entrance-02')]
    Page Should Contain Element               xpath=//button[contains(text(), 'FZ-Entrance-02')]
    Click Element                             xpath=//button[contains(text(), 'FZ-Entrance-02')]

    Sleep                                     1

    Capture Page Screenshot                   1.png

    Sleep                                     1

    Wait Until Page Contains Element          xpath=//button/h2/div[contains(text(), 'Ground')]
    Page Should Contain Element               xpath=//button/h2/div[contains(text(), 'Ground')]
    Click Element                             xpath=//button/h2/div[contains(text(), 'Ground')]

    Sleep                                     1

    #tab: Yard
    Wait Until Page Contains Element          xpath=//button/h2/div[contains(text(), 'Yard')]
    Page Should Contain Element               xpath=//button/h2/div[contains(text(), 'Yard')]
    Click Element                             xpath=//button/h2/div[contains(text(), 'Yard')]

    Sleep                                     1

    Wait Until Page Contains Element          xpath=//button[contains(text(), 'FZ-Yard-01')]
    Page Should Contain Element               xpath=//button[contains(text(), 'FZ-Yard-01')]
    Click Element                             xpath=//button[contains(text(), 'FZ-Yard-01')]

    Sleep                                     1

    Capture Page Screenshot                   3.png

    Sleep                                     1

    Wait Until Page Contains Element          xpath=//button/h2/div[contains(text(), 'Yard')]
    Page Should Contain Element               xpath=//button/h2/div[contains(text(), 'Yard')]
    Click Element                             xpath=//button/h2/div[contains(text(), 'Yard')]

    Sleep                                     1

    ${windowhandles_1}        Get Window Titles

    ${windowhandles_2}        Get Window Handles

    Log               Check Window: ${windowhandles_1}         console=yes

    Log               Check Window: ${windowhandles_2}         console=yes

    Sleep                                     1

Tab 3 Menu 2

    Sleep                                     1

    Wait Until Page Contains Element          xpath=//span[contains(text(), 'พื้นที่คลังสินค้า')]
    Click Element                             xpath=//span[contains(text(), 'พื้นที่คลังสินค้า')]
    Page Should Contain Element               xpath=//span[contains(text(), 'พื้นที่คลังสินค้า')]

    Wait Until Page Contains Element          xpath=//div/li/a[contains(text(), 'พื้นที่คลังสินค้า (ระนอง)')]
    Click Element                             xpath=//div/li/a[contains(text(), 'พื้นที่คลังสินค้า (ระนอง)')]
    Page Should Contain Element               xpath=//div/li/a[contains(text(), 'พื้นที่คลังสินค้า (ระนอง)')]

    Sleep                                     1

    Scroll Element Into View                  xpath=//span[contains(text(), 'โครงสร้างเว็บไซต์')]

    Sleep                                     1

    #tab: Chemical_Room
    Wait Until Page Contains Element          xpath=//button[contains(text(), 'FZ-CMC-01')]
    Page Should Contain Element               xpath=//button[contains(text(), 'FZ-CMC-01')]
    # Click Element                             xpath=//button[contains(text(), 'FZ-CMC-01')]

    Sleep                                     1

    Wait Until Page Contains Element          xpath=//button/h2/div[contains(text(), 'Chemical_Room')]
    Page Should Contain Element               xpath=//button/h2/div[contains(text(), 'Chemical_Room')]
    Click Element                             xpath=//button/h2/div[contains(text(), 'Chemical_Room')]

    Sleep                                     1

    #tab: Cool_Room
    Wait Until Page Contains Element          xpath=//button/h2/div[contains(text(), 'Cool_Room')]
    Page Should Contain Element               xpath=//button/h2/div[contains(text(), 'Cool_Room')]
    Click Element                             xpath=//button/h2/div[contains(text(), 'Cool_Room')]

    Sleep                                     1

    Wait Until Page Contains Element          xpath=//button[contains(text(), 'FZ-CL-03')]
    Page Should Contain Element               xpath=//button[contains(text(), 'FZ-CL-03')]
    # Click Element                             xpath=//button[contains(text(), 'FZ-CL-03')]
    
    Sleep                                     1

    Wait Until Page Contains Element          xpath=//button/h2/div[contains(text(), 'Cool_Room')]
    Page Should Contain Element               xpath=//button/h2/div[contains(text(), 'Cool_Room')]
    Click Element                             xpath=//button/h2/div[contains(text(), 'Cool_Room')]

    Sleep                                     1

    #tab: Ground
    Wait Until Page Contains Element          xpath=//button/h2/div[contains(text(), 'Ground')]
    Page Should Contain Element               xpath=//button/h2/div[contains(text(), 'Ground')]
    Click Element                             xpath=//button/h2/div[contains(text(), 'Ground')]

    Sleep                                     1

    Wait Until Page Contains Element          xpath=//button[contains(text(), 'FZ-TT-03')]
    Page Should Contain Element               xpath=//button[contains(text(), 'FZ-TT-03')]
    # Click Element                             xpath=//button[contains(text(), 'FZ-TT-03')]
    
    Sleep                                     1

    Wait Until Page Contains Element          xpath=//button/h2/div[contains(text(), 'Ground')]
    Page Should Contain Element               xpath=//button/h2/div[contains(text(), 'Ground')]
    Click Element                             xpath=//button/h2/div[contains(text(), 'Ground')]

    #tab: Mezzanine
    Wait Until Page Contains Element          xpath=//button/h2/div[contains(text(), 'Mezzanine')]
    Page Should Contain Element               xpath=//button/h2/div[contains(text(), 'Mezzanine')]
    Click Element                             xpath=//button/h2/div[contains(text(), 'Mezzanine')]

    Sleep                                     1

    Wait Until Page Contains Element          xpath=//button[contains(text(), 'FZ-WH-07')]
    Page Should Contain Element               xpath=//button[contains(text(), 'FZ-WH-07')]
    # Click Element                             xpath=//button[contains(text(), 'FZ-WH-07')]
    
    Sleep                                     1

    #tab: Roof_Shade
    Wait Until Page Contains Element          xpath=//button/h2/div[contains(text(), 'Roof_Shade')]
    Page Should Contain Element               xpath=//button/h2/div[contains(text(), 'Roof_Shade')]
    Click Element                             xpath=//button/h2/div[contains(text(), 'Roof_Shade')]

    Sleep                                     1

    Wait Until Page Contains Element          xpath=//button[contains(text(), 'FZ-RS-01')]
    Page Should Contain Element               xpath=//button[contains(text(), 'FZ-RS-01')]
    # Click Element                             xpath=//button[contains(text(), 'FZ-RS-01')]

    Sleep                                     1

    Wait Until Page Contains Element          xpath=//button/h2/div[contains(text(), 'Roof_Shade')]
    Page Should Contain Element               xpath=//button/h2/div[contains(text(), 'Roof_Shade')]
    Click Element                             xpath=//button/h2/div[contains(text(), 'Roof_Shade')]

    Sleep                                     1

    #tab: Temporary_Tent
    Wait Until Page Contains Element          xpath=//button/h2/div[contains(text(), 'Temporary_Tent')]
    Page Should Contain Element               xpath=//button/h2/div[contains(text(), 'Temporary_Tent')]
    Click Element                             xpath=//button/h2/div[contains(text(), 'Temporary_Tent')]

    Sleep                                     1

    Wait Until Page Contains Element          xpath=//button[contains(text(), 'FZ-TT-01')]
    Page Should Contain Element               xpath=//button[contains(text(), 'FZ-TT-01')]
    # Click Element                             xpath=//button[contains(text(), 'FZ-TT-01')]

    Sleep                                     1

    Wait Until Page Contains Element          xpath=//button/h2/div[contains(text(), 'Temporary_Tent')]
    Page Should Contain Element               xpath=//button/h2/div[contains(text(), 'Temporary_Tent')]
    Click Element                             xpath=//button/h2/div[contains(text(), 'Temporary_Tent')]

    Sleep                                     1

    #tab: Warehouse
    Wait Until Page Contains Element          xpath=//button/h2/div[contains(text(), 'Warehouse')]
    Page Should Contain Element               xpath=//button/h2/div[contains(text(), 'Warehouse')]
    Click Element                             xpath=//button/h2/div[contains(text(), 'Warehouse')]

    Sleep                                     1

    Wait Until Page Contains Element          xpath=//button[contains(text(), 'FZ-WH-02')]
    Page Should Contain Element               xpath=//button[contains(text(), 'FZ-WH-02')]
    # Click Element                             xpath=//button[contains(text(), 'FZ-WH-02')]

    Sleep                                     1

    Wait Until Page Contains Element          xpath=//button/h2/div[contains(text(), 'Warehouse')]
    Page Should Contain Element               xpath=//button/h2/div[contains(text(), 'Warehouse')]
    Click Element                             xpath=//button/h2/div[contains(text(), 'Warehouse')]

Tab 3 Menu 3

    Sleep                                     1

    Wait Until Page Contains Element          xpath=//span[contains(text(), 'พื้นที่คลังสินค้า')]
    Click Element                             xpath=//span[contains(text(), 'พื้นที่คลังสินค้า')]
    Page Should Contain Element               xpath=//span[contains(text(), 'พื้นที่คลังสินค้า')]

    Wait Until Page Contains Element          xpath=//div/li/a[contains(text(), 'พื้นที่ปลอดภาษี (สงขลา)')]
    Click Element                             xpath=//div/li/a[contains(text(), 'พื้นที่ปลอดภาษี (สงขลา)')]
    Page Should Contain Element               xpath=//div/li/a[contains(text(), 'พื้นที่ปลอดภาษี (สงขลา)')]

    Sleep                                     1

    Scroll Element Into View                  xpath=//span[contains(text(), 'โครงสร้างเว็บไซต์')]

    Sleep                                     1

    #tab: Chemical Room
    Wait Until Page Contains Element          xpath=//button/h2/div[contains(text(), 'Chemical room')]
    Page Should Contain Element               xpath=//button/h2/div[contains(text(), 'Chemical room')]
    Click Element                             xpath=//button/h2/div[contains(text(), 'Chemical room')]

    Sleep                                     1

    Wait Until Page Contains Element          xpath=//button[contains(text(), 'FZ-CMC-02')]
    Page Should Contain Element               xpath=//button[contains(text(), 'FZ-CMC-02')]
    # Click Element                             xpath=//button[contains(text(), 'FZ-CMC-02')]
    
    Sleep                                     1

    Wait Until Page Contains Element          xpath=//button/h2/div[contains(text(), 'Chemical room')]
    Page Should Contain Element               xpath=//button/h2/div[contains(text(), 'Chemical room')]
    Click Element                             xpath=//button/h2/div[contains(text(), 'Chemical room')]

    Sleep                                     1

    #tab: WH & Cool Room
    Wait Until Page Contains Element          xpath=//button/h2/div[contains(text(), 'WH & Cool room')]
    Page Should Contain Element               xpath=//button/h2/div[contains(text(), 'WH & Cool room')]
    Click Element                             xpath=//button/h2/div[contains(text(), 'WH & Cool room')]

    Sleep                                     1

    Wait Until Page Contains Element          xpath=//button[contains(text(), 'FZ-WH-01')]
    Page Should Contain Element               xpath=//button[contains(text(), 'FZ-WH-01')]
    # Click Element                             xpath=//button[contains(text(), 'FZ-WH-01')]
    
    Sleep                                     1

    Wait Until Page Contains Element          xpath=//button/h2/div[contains(text(), 'WH & Cool room')]
    Page Should Contain Element               xpath=//button/h2/div[contains(text(), 'WH & Cool room')]
    Click Element                             xpath=//button/h2/div[contains(text(), 'WH & Cool room')]

    Sleep                                     1

    #tab: Yard
    Wait Until Page Contains Element          xpath=//button/h2/div[contains(text(), 'Yard')]
    Page Should Contain Element               xpath=//button/h2/div[contains(text(), 'Yard')]
    Click Element                             xpath=//button/h2/div[contains(text(), 'Yard')]

    Sleep                                     1

    Wait Until Page Contains Element          xpath=//button[contains(text(), 'FZ-Yard-01')]
    Page Should Contain Element               xpath=//button[contains(text(), 'FZ-Yard-01')]
    # Click Element                             xpath=//button[contains(text(), 'FZ-Yard-01')]

    Sleep                                     1

    Wait Until Page Contains Element          xpath=//button/h2/div[contains(text(), 'Yard')]
    Page Should Contain Element               xpath=//button/h2/div[contains(text(), 'Yard')]
    Click Element                             xpath=//button/h2/div[contains(text(), 'Yard')]

Tab 3 Menu 4

    Sleep                                     1

    Wait Until Page Contains Element          xpath=//span[contains(text(), 'พื้นที่คลังสินค้า')]
    Click Element                             xpath=//span[contains(text(), 'พื้นที่คลังสินค้า')]
    Page Should Contain Element               xpath=//span[contains(text(), 'พื้นที่คลังสินค้า')]

    Wait Until Page Contains Element          xpath=//div/li/a[contains(text(), 'พื้นที่คลังสินค้า (สงขลา)')]
    Click Element                             xpath=//div/li/a[contains(text(), 'พื้นที่คลังสินค้า (สงขลา)')]
    Page Should Contain Element               xpath=//div/li/a[contains(text(), 'พื้นที่คลังสินค้า (สงขลา)')]

    Sleep                                     1

    Scroll Element Into View                  xpath=//span[contains(text(), 'โครงสร้างเว็บไซต์')]

    Sleep                                     1

    #tab: WH & Cool Room
    Wait Until Page Contains Element          xpath=//button/h2/div[contains(text(), 'WH & Cool room')]
    Page Should Contain Element               xpath=//button/h2/div[contains(text(), 'WH & Cool room')]
    Click Element                             xpath=//button/h2/div[contains(text(), 'WH & Cool room')]

    Sleep                                     1

    Wait Until Page Contains Element          xpath=//button[contains(text(), 'FZ-CL-01')]
    Page Should Contain Element               xpath=//button[contains(text(), 'FZ-CL-01')]
    # Click Element                             xpath=//button[contains(text(), 'FZ-CL-01')]
    
    Sleep                                     1

    Wait Until Page Contains Element          xpath=//button/h2/div[contains(text(), 'WH & Cool room')]
    Page Should Contain Element               xpath=//button/h2/div[contains(text(), 'WH & Cool room')]
    Click Element                             xpath=//button/h2/div[contains(text(), 'WH & Cool room')]

*** Test Cases ***

Main Test
    
    Open Browser CASHCALL    ${URL}    ${BROWSER}

    Login     ${URL}

    Tab 3 Menu 1

    # Tab 3 Menu 2

    # Tab 3 Menu 3

    # Tab 3 Menu 4

    [Teardown]            Close Browser
