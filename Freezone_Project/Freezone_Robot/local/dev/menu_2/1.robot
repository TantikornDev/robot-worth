*** Settings ***
Library  SeleniumLibrary

*** Variables ***

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

    ${windowhandles}        Get Window Titles

    # Title Should Be    หน้าหลัก | PTTEP

Choose Menu
    [Arguments]     ${menu}

    Page Should Contain Element               ${menu}
    Click Element                             ${menu}

Login In-User 

    Sleep                                     5

    Wait Until Page Contains Element          xpath=//button[@id="onetrust-accept-btn-handler"]

    # ${element_1}         Get Element Count    xpath=//button[@id="onetrust-accept-btn-handler"]
    # Choose Menu                               ${element_1}
    
    Click Element                             xpath=//button[@id="onetrust-accept-btn-handler"]

    Wait Until Page Contains Element          xpath=//select[@id="select_type_login"]
    Click Element                             xpath=//select[@id="select_type_login"]

    Wait Until Page Contains Element          xpath=//option[@id="ad"]
    Click Element                             xpath=//option[@id="ad"]

    Sleep                                     5

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
        
    ${element_1}    Get Element Count       xpath=//button[contains(text(), '${Submit_Button}')]

    Click Element                           xpath=//button[contains(text(), '${Submit_Button}')]

    Log               Check Function: 2. Login Requestor C2                 console=yes
    Log               Check Element: 'Input Secret Code' ${element_0}       console=yes
    Log               Check Element: 'Login Button' ${element_1}            console=yes

Tab 2 Menu 1

    Sleep                                     2

    Wait Until Page Contains Element          xpath=//span[contains(text(), 'รายงานภาพถ่ายและจัดเก็บสินค้า')]
    Page Should Contain Element               xpath=//span[contains(text(), 'รายงานภาพถ่ายและจัดเก็บสินค้า')]
    Click Element                             xpath=//span[contains(text(), 'รายงานภาพถ่ายและจัดเก็บสินค้า')]
    
    Sleep                                     1

    Wait Until Page Contains Element          xpath=//div/li/a[contains(text(), 'รายงานการจัดเก็บสินค้า')]
    Page Should Contain Element               xpath=//div/li/a[contains(text(), 'รายงานการจัดเก็บสินค้า')]
    Click Element                             xpath=//div/li/a[contains(text(), 'รายงานการจัดเก็บสินค้า')]

    Sleep                                     1

    Scroll Element Into View                  xpath=//button[contains(text(), 'ค้นหา')]
 
    # search - plant
    Wait Until Page Contains Element          xpath=//select[@id="plant"]
    Page Should Contain Element               xpath=//select[@id="plant"]        
    Click Element                             xpath=//select[@id="plant"]

    Wait Until Page Contains Element          xpath=//option[@value='9902']
    Page Should Contain Element               xpath=//option[@value='9902']    
    Click Element                             xpath=//option[@value='9902']

    # search - type
    Wait Until Page Contains Element          xpath=//select[@id="type"]
    Page Should Contain Element               xpath=//select[@id="type"]        
    Click Element                             xpath=//select[@id="type"]

    Wait Until Page Contains Element          xpath=//option[@value='CCTV_Snapshot']
    Page Should Contain Element               xpath=//option[@value='CCTV_Snapshot']    
    Click Element                             xpath=//option[@value='CCTV_Snapshot']

    # search - zone 
    Wait Until Page Contains Element          xpath=//select[@id="zone"]
    Page Should Contain Element               xpath=//select[@id="zone"]        
    Click Element                             xpath=//select[@id="zone"]

    Wait Until Page Contains Element          xpath=//option[contains(text(), 'Yard')]
    Page Should Contain Element               xpath=//option[contains(text(), 'Yard')]
    Click Element                             xpath=//option[contains(text(), 'Yard')]

    # search - cctv 
    Wait Until Page Contains Element          xpath=//select[@id="cctv"]
    Page Should Contain Element               xpath=//select[@id="cctv"]        
    Click Element                             xpath=//select[@id="cctv"]

    Wait Until Page Contains Element          xpath=//option[contains(text(), 'FZ-Yard-01')]
    Page Should Contain Element               xpath=//option[contains(text(), 'FZ-Yard-01')]
    Click Element                             xpath=//option[contains(text(), 'FZ-Yard-01')]

    # search - date from 
    Wait Until Page Contains Element          xpath=//div[@data-testid="date-start-picker"]/div/button[2]
    Page Should Contain Element               xpath=//div[@data-testid="date-start-picker"]/div/button[2]
    Click Element                             xpath=//div[@data-testid="date-start-picker"]/div/button[2]

    Sleep                                     1

    #click month 
    Wait Until Page Contains Element          xpath=//div[@class="react-calendar"]/div/button[3]
    Page Should Contain Element               xpath=//div[@class="react-calendar"]/div/button[3]
    Click Element                             xpath=//div[@class="react-calendar"]/div/button[3]

    Sleep                                     1

    #click year 
    Wait Until Page Contains Element          xpath=//div[@class="react-calendar"]/div/button[3]
    Page Should Contain Element               xpath=//div[@class="react-calendar"]/div/button[3]
    Click Element                             xpath=//div[@class="react-calendar"]/div/button[3]

    Sleep                                     1

    #choose year 
    Wait Until Page Contains Element          xpath=//div[@class="react-calendar__viewContainer"]/div/div/button[2]
    Page Should Contain Element               xpath=//div[@class="react-calendar__viewContainer"]/div/div/button[2]
    Click Element                             xpath=//div[@class="react-calendar__viewContainer"]/div/div/button[2]

    Sleep                                     1

    #choose month 
    Wait Until Page Contains Element          xpath=//div[@class="react-calendar__viewContainer"]/div/div/button[6]
    Page Should Contain Element               xpath=//div[@class="react-calendar__viewContainer"]/div/div/button[6]
    Click Element                             xpath=//div[@class="react-calendar__viewContainer"]/div/div/button[6]

    Sleep                                     1

    #choose day 
    Wait Until Page Contains Element          xpath=//div[@class="react-calendar__month-view"]/div/div/div[2]/button[3]
    Page Should Contain Element               xpath=//div[@class="react-calendar__month-view"]/div/div/div[2]/button[3]
    Click Element                             xpath=//div[@class="react-calendar__month-view"]/div/div/div[2]/button[3]
    
    # button - search
    Wait Until Page Contains Element          xpath=//button[contains(text(), 'ค้นหา')]
    Page Should Contain Element               xpath=//button[contains(text(), 'ค้นหา')]
    Click Element                             xpath=//button[contains(text(), 'ค้นหา')]     

    Sleep                                     3

    Scroll Element Into View                  xpath=//div[@data-testid="pageNavigation-display"]

    Sleep                                     2

    Wait Until Page Contains Element          xpath=//div[@class="grid grid-cols-12"]/div
    Page Should Contain Element               xpath=//div[@class="grid grid-cols-12"]/div

    ${element_1}    Get Element Count         xpath=//div[@class="grid grid-cols-12"]/div
    Log             Check Element: 'Pic' ${element_1}                               console=yes

    Sleep                                     1

    Capture Page Screenshot                   picture.png

    Sleep                                     1
    
    # button - clear
    Wait Until Page Contains Element          xpath=//button[contains(text(), 'ล้างทั้งหมด')]
    Page Should Contain Element               xpath=//button[contains(text(), 'ล้างทั้งหมด')]
    Click Element                             xpath=//button[contains(text(), 'ล้างทั้งหมด')]

Tab 2 Menu 2

    Sleep                                     2

    Wait Until Page Contains Element          xpath=//span[contains(text(), 'รายงานภาพถ่ายและจัดเก็บสินค้า')]
    Page Should Contain Element               xpath=//span[contains(text(), 'รายงานภาพถ่ายและจัดเก็บสินค้า')]
    Click Element                             xpath=//span[contains(text(), 'รายงานภาพถ่ายและจัดเก็บสินค้า')]
    
    Sleep                                     1

    Wait Until Page Contains Element          xpath=//div/li/a[contains(text(), 'รายงานภาพตามพื้นที่')]
    Page Should Contain Element               xpath=//div/li/a[contains(text(), 'รายงานภาพตามพื้นที่')]
    Click Element                             xpath=//div/li/a[contains(text(), 'รายงานภาพตามพื้นที่')]

    Sleep                                     1

    Scroll Element Into View                  xpath=//button[contains(text(), 'ค้นหา')]
 
    # search - plant
    Wait Until Page Contains Element          xpath=//select[@id="plant"]
    Page Should Contain Element               xpath=//select[@id="plant"]        
    Click Element                             xpath=//select[@id="plant"]

    Wait Until Page Contains Element          xpath=//option[@value='9902']
    Page Should Contain Element               xpath=//option[@value='9902']    
    Click Element                             xpath=//option[@value='9902']

    # search - type
    Wait Until Page Contains Element          xpath=//select[@id="type"]
    Page Should Contain Element               xpath=//select[@id="type"]        
    Click Element                             xpath=//select[@id="type"]

    Wait Until Page Contains Element          xpath=//option[@value='CCTV_Snapshot']
    Page Should Contain Element               xpath=//option[@value='CCTV_Snapshot']    
    Click Element                             xpath=//option[@value='CCTV_Snapshot']

    # search - zone 
    Wait Until Page Contains Element          xpath=//select[@id="zone"]
    Page Should Contain Element               xpath=//select[@id="zone"]        
    Click Element                             xpath=//select[@id="zone"]

    Wait Until Page Contains Element          xpath=//option[contains(text(), 'Ground')]
    Page Should Contain Element               xpath=//option[contains(text(), 'Ground')]
    Click Element                             xpath=//option[contains(text(), 'Ground')]

    # search - cctv 
    Wait Until Page Contains Element          xpath=//select[@id="cctv"]
    Page Should Contain Element               xpath=//select[@id="cctv"]        
    Click Element                             xpath=//select[@id="cctv"]

    Wait Until Page Contains Element          xpath=//option[contains(text(), 'FZ-Entrance-02')]
    Page Should Contain Element               xpath=//option[contains(text(), 'FZ-Entrance-02')]
    Click Element                             xpath=//option[contains(text(), 'FZ-Entrance-02')]

    # search - date from 
    Wait Until Page Contains Element          xpath=//div[@data-testid="date-start-picker"]/div/button[2]
    Page Should Contain Element               xpath=//div[@data-testid="date-start-picker"]/div/button[2]
    Click Element                             xpath=//div[@data-testid="date-start-picker"]/div/button[2]

    Sleep                                     1

    #click month 
    Wait Until Page Contains Element          xpath=//div[@class="react-calendar"]/div/button[3]
    Page Should Contain Element               xpath=//div[@class="react-calendar"]/div/button[3]
    Click Element                             xpath=//div[@class="react-calendar"]/div/button[3]

    Sleep                                     1

    #click year 
    Wait Until Page Contains Element          xpath=//div[@class="react-calendar"]/div/button[3]
    Page Should Contain Element               xpath=//div[@class="react-calendar"]/div/button[3]
    Click Element                             xpath=//div[@class="react-calendar"]/div/button[3]

    Sleep                                     1

    #choose year 
    Wait Until Page Contains Element          xpath=//div[@class="react-calendar__viewContainer"]/div/div/button[2]
    Page Should Contain Element               xpath=//div[@class="react-calendar__viewContainer"]/div/div/button[2]
    Click Element                             xpath=//div[@class="react-calendar__viewContainer"]/div/div/button[2]

    Sleep                                     1

    #choose month 
    Wait Until Page Contains Element          xpath=//div[@class="react-calendar__viewContainer"]/div/div/button[6]
    Page Should Contain Element               xpath=//div[@class="react-calendar__viewContainer"]/div/div/button[6]
    Click Element                             xpath=//div[@class="react-calendar__viewContainer"]/div/div/button[6]

    Sleep                                     1

    #choose day 
    Wait Until Page Contains Element          xpath=//div[@class="react-calendar__month-view"]/div/div/div[2]/button[3]
    Page Should Contain Element               xpath=//div[@class="react-calendar__month-view"]/div/div/div[2]/button[3]
    Click Element                             xpath=//div[@class="react-calendar__month-view"]/div/div/div[2]/button[3]
    
    # button - search
    Wait Until Page Contains Element          xpath=//button[contains(text(), 'ค้นหา')]
    Page Should Contain Element               xpath=//button[contains(text(), 'ค้นหา')]
    Click Element                             xpath=//button[contains(text(), 'ค้นหา')]     

    Sleep                                     3

    Scroll Element Into View                  xpath=//div[@data-testid="pageNavigation-display"]

    Sleep                                     2

    Wait Until Page Contains Element          xpath=//div[@class="grid grid-cols-12"]/div
    Page Should Contain Element               xpath=//div[@class="grid grid-cols-12"]/div

    ${element_2}    Get Element Count         xpath=//div[@class="grid grid-cols-12"]/div
    Log             Check Element: 'Picture 2' ${element_2}                               console=yes

    Sleep                                     1

    Capture Page Screenshot                   picture_2.png

    Sleep                                     1

    # button - clear
    Wait Until Page Contains Element          xpath=//button[contains(text(), 'ล้างทั้งหมด')]
    Page Should Contain Element               xpath=//button[contains(text(), 'ล้างทั้งหมด')]
    Click Element                             xpath=//button[contains(text(), 'ล้างทั้งหมด')]

*** Test Cases ***

Main Test
    
    Open Browser CASHCALL    ${URL}    ${BROWSER}

    Login    ${URL}

    Tab 2 Menu 1

    Tab 2 Menu 2

    [Teardown]            Close Browser
