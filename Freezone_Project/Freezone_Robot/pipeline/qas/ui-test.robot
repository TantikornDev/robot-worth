*** Settings ***
Library  SeleniumLibrary
Library  RequestsLibrary
Library  OperatingSystem

Suite Teardown  Delete All Sessions

*** Variables ***

${URL}                   ${APPLICATION}/dev
${BROWSER}               headlesschrome
${Submit_Button}         เข้าสู่ระบบ
${robot_login}           RB-Run-pipeline-test@pttep.com
${page_name}             หน้าล็อกอินโรบอท | PTTEP

${menu_1}                รายงานควบคุมสินค้าคงคลัง
${menu_1_1}              รายงานสินค้าคงเหลือ
${menu_1_2}              รายงานเคลื่อนไหวสินค้า
${menu_1_3}              รายงานขอขยายระยะเวลาจัดเก็บ
${menu_1_4}              รายงานประจำงวด

${menu_2}                รายงานภาพถ่ายและจัดเก็บสินค้า
${menu_2_1}              รายงานการจัดเก็บสินค้า
${menu_2_2}              รายงานภาพตามพื้นที่

${menu_3}                พื้นที่คลังสินค้า
${menu_3_1}              พื้นที่ปลอดภาษี (ระนอง)
${menu_3_2}              พื้นที่คลังสินค้า (ระนอง)

${menu_4}                จัดการข้อมูล
${menu_4_1}              ประวัติการเข้าใช้งานพนักงาน
${menu_4_2}              ประวัติการเข้าใช้บุคคลภายนอก
${menu_4_3}              จัดการข้อมูลผู้ใช้งานภายนอก

*** Test Cases ***

Main Test
    
    Open Browser FREEZONE       ${URL}    ${BROWSER}

    Login                       ${URL}

    Check Tab Menu 

    Into Menu                   ${menu_1}   ${menu_1_1}   
    Into Menu                   ${menu_1}   ${menu_1_2}   
    Into Menu                   ${menu_1}   ${menu_1_3}   
    Into Menu                   ${menu_1}   ${menu_1_4}   

    Into Menu                   ${menu_2}   ${menu_2_1}   
    Into Menu                   ${menu_2}   ${menu_2_2}    

    Into Menu                   ${menu_3}   ${menu_3_1}   
    Into Menu                   ${menu_3}   ${menu_3_2} 

    Into Menu                   ${menu_4}   ${menu_4_1}   
    Into Menu                   ${menu_4}   ${menu_4_2}  
    Into Menu                   ${menu_4}   ${menu_4_3}    

    [Teardown]        Close Browser

*** Keywords ***

Open Browser FREEZONE
    
    [Arguments]     ${URL}    ${BROWSER}

    Open Browser    ${URL}    ${BROWSER}

    Create Session       my_browser        ${URL}

    ${windowtitles}=     Get Window Titles

    Log                  Check Function: '1. Open Browser FREEZONE Title Name:' ${windowtitles}    console=yes

    Log                  Check Function: '1. Open Browser FREEZONE url:' ${URL}    console=yes

    # Title Should Be      ${page_name}

Login

    [Arguments]     ${URL}   

    Create Session        my_browser        ${URL}

    Sleep             3

    ${element_0}    Get Element Count       xpath=//input[@id="codeBypass"]
    ${element_1}    Get Element Count       xpath=//button[contains(text(), '${Submit_Button}')]

    Log               Check Function: Check PDPA Pop up                     console=yes
    Log               Check Element: 'Input Secret Code' ${element_0}       console=yes
    Log               Check Element: 'Login Button' ${element_1}            console=yes

    Wait Until Page Contains Element        xpath=//input[@id="codeBypass"]
    Page Should Contain Element             xpath=//input[@id="codeBypass"]
    Input Text                              xpath=//input[@id="codeBypass"]      ${robot_login}

    Wait Until Page Contains Element        xpath=//button[contains(text(), '${Submit_Button}')]
    Page Should Contain Element             xpath=//button[contains(text(), '${Submit_Button}')]
    Click Element                           xpath=//button[contains(text(), '${Submit_Button}')]
    
Check Tab Menu 
    
    Sleep             2

    Wait Until Page Contains Element        xpath=//div[@data-testid="dropdowns-inventoryControlReport-display"]
    Page Should Contain Element             xpath=//div[@data-testid="dropdowns-inventoryControlReport-display"]

    ${element_2}    Get Element Count       xpath=//div[@data-testid="dropdowns-inventoryControlReport-display"]

    Wait Until Page Contains Element        xpath=//div[@data-testid="dropdowns-photoImageStorageReport-display"]
    Page Should Contain Element             xpath=//div[@data-testid="dropdowns-photoImageStorageReport-display"]

    ${element_3}    Get Element Count       xpath=//div[@data-testid="dropdowns-photoImageStorageReport-display"]

    Wait Until Page Contains Element        xpath=//div[@data-testid="dropdowns-wahereHouse-display"]
    Page Should Contain Element             xpath=//div[@data-testid="dropdowns-wahereHouse-display"]

    ${element_4}    Get Element Count       xpath=//div[@data-testid="dropdowns-wahereHouse-display"]

    Wait Until Page Contains Element        xpath=//div[@data-testid="dropdowns-manager-display"]
    Page Should Contain Element             xpath=//div[@data-testid="dropdowns-manager-display"]

    ${element_5}    Get Element Count       xpath=//div[@data-testid="dropdowns-manager-display"]

    Log               Check Function: 3. Check Interface Tab Menu                                  console=yes
    Log               Check Element: 'Menu: รายงานควบคุมสินค้าคงคลัง' ${element_2}                     console=yes

    Log               Check Function: 3. Check Interface Tab Menu                                  console=yes
    Log               Check Element: 'Menu: รายงานภาพถ่ายและจัดเก็บสินค้า' ${element_3}                 console=yes

    Log               Check Function: 3. Check Interface Tab Menu                                  console=yes
    Log               Check Element: 'Menu: พื้นที่คลังสินค้า' ${element_4}                               console=yes

    Log               Check Function: 3. Check Interface Tab Menu                                  console=yes
    Log               Check Element: 'Menu: จัดการข้อมูล' ${element_5}                                console=yes

Into Menu 
    
    [Arguments]     ${Main_Menu}   ${Sub_Menu}   
    
    Sleep                                     1

    Wait Until Page Contains Element          xpath=//span[contains(text(), '${Main_Menu}')]
    Page Should Contain Element               xpath=//span[contains(text(), '${Main_Menu}')]
    Click Element                             xpath=//span[contains(text(), '${Main_Menu}')]
    
    Sleep                                     1

    Wait Until Page Contains Element          xpath=//div/li/a[contains(text(), '${Sub_Menu}')]
    Page Should Contain Element               xpath=//div/li/a[contains(text(), '${Sub_Menu}')]
    Click Element                             xpath=//div/li/a[contains(text(), '${Sub_Menu}')]

    Log               Check Function: ${Main_Menu}                                                 console=yes
    Log               Check Element: 'Menu: ' ${Sub_Menu}                                          console=yes

Logout

    Sleep             1    

    Wait Until Page Contains Element        xpath=//div[@data-testid="flowbite-avatar-img"]
    Page Should Contain Element             xpath=//div[@data-testid="flowbite-avatar-img"]

    ${element_5}    Get Element Count       xpath=//div[@data-testid="flowbite-avatar-img"]

    Log               Check Function: 4. Check Log out                                        console=yes
    Log               Check Element: 'Img Log out' ${element_5}                               console=yes

    Click Element                           xpath=//div[@data-testid="flowbite-avatar-img"]

    Wait Until Page Contains Element        xpath=//div/div/div[@data-testid="dropdowns-language-display"]/ul/div[@data-testid="flowbite-tooltip"]/div/ul/div/li[contains(text(), 'ออกจากระบบ')]
    Page Should Contain Element             xpath=//div/div/div[@data-testid="dropdowns-language-display"]/ul/div[@data-testid="flowbite-tooltip"]/div/ul/div/li[contains(text(), 'ออกจากระบบ')]

    ${element_6}    Get Element Count       xpath=//div/div/div[@data-testid="dropdowns-language-display"]/ul/div[@data-testid="flowbite-tooltip"]/div/ul/div/li[contains(text(), 'ออกจากระบบ')]

    Log               Check Function: 4. Check Log out                                        console=yes
    Log               Check Element: 'Log out Button' ${element_6}                            console=yes

    Click Element                           xpath=//div/div/div[@data-testid="dropdowns-language-display"]/ul/div[@data-testid="flowbite-tooltip"]/div/ul/div/li[contains(text(), 'ออกจากระบบ')]                    
