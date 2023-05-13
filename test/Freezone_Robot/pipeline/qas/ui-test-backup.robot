*** Settings ***
Library  SeleniumLibrary
Library  RequestsLibrary
Library  OperatingSystem

Suite Teardown  Delete All Sessions

*** Variables ***

${URL}                   ${APPLICATION}/dev
# ${URL}                   https://freezoneinventory-dev.pttep.com/dev
${BROWSER}               headlesschrome
${Submit_Button}         เข้าสู่ระบบ
${robot_login}           106691@Customs.go.th
${page_name}             หน้าล็อกอินโรบอท | PTTEP

*** Test Cases ***

Main Test
    
    Open Browser FREEZONE       ${URL}    ${BROWSER}

    Login              ${URL}

    Check Tab Menu 

    Tab 1 Menu 1

    Tab 1 Menu 2

    Tab 1 Menu 3

    Tab 1 Menu 4 

    Tab 2 Menu 1

    Tab 2 Menu 2

    # Tab 4 Menu 1

    # Tab 4 Menu 2

    # Tab 4 Menu 3

    [Teardown]        Close Browser

*** Keywords ***

Open Browser FREEZONE
    
    [Arguments]     ${URL}    ${BROWSER}

    Open Browser    ${URL}    ${BROWSER}

    Create Session       my_browser        ${URL}

    ${windowtitles}=     Get Window Titles

    Log                  Check Function: '1. Open Browser FREEZONE Title Name:' ${windowtitles}    console=yes

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

    # Wait Until Page Contains Element        xpath=//div[@data-testid="dropdowns-manager-display"]
    # Page Should Contain Element             xpath=//div[@data-testid="dropdowns-manager-display"]

    # ${element_5}    Get Element Count       xpath=//div[@data-testid="dropdowns-manager-display"]

    Log               Check Function: 3. Check Interface Tab Menu                                  console=yes
    Log               Check Element: 'Menu: รายงานควบคุมสินค้าคงคลัง' ${element_2}                     console=yes

    Log               Check Function: 3. Check Interface Tab Menu                                  console=yes
    Log               Check Element: 'Menu: รายงานภาพถ่ายและจัดเก็บสินค้า' ${element_3}                 console=yes

    Log               Check Function: 3. Check Interface Tab Menu                                  console=yes
    Log               Check Element: 'Menu: พื้นที่คลังสินค้า' ${element_4}                               console=yes

    # Log               Check Function: 3. Check Interface Tab Menu                                  console=yes
    # Log               Check Element: 'Menu: จัดการข้อมูล' ${element_5}                                console=yes

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

Tab 1 Menu 1

    Sleep                                     1

    Wait Until Page Contains Element          xpath=//span[contains(text(), 'รายงานควบคุมสินค้าคงคลัง')]
    Page Should Contain Element               xpath=//span[contains(text(), 'รายงานควบคุมสินค้าคงคลัง')]
    Click Element                             xpath=//span[contains(text(), 'รายงานควบคุมสินค้าคงคลัง')]
    
    Sleep                                     1

    Wait Until Page Contains Element          xpath=//div/li/a[contains(text(), 'รายงานสินค้าคงเหลือ')]
    Page Should Contain Element               xpath=//div/li/a[contains(text(), 'รายงานสินค้าคงเหลือ')]
    Click Element                             xpath=//div/li/a[contains(text(), 'รายงานสินค้าคงเหลือ')]

    Log               Check Function: 4. Menu 1 / 1                                                 console=yes
    Log               Check Element: 'Menu: รายงานสินค้าคงเหลือ'                                       console=yes

Tab 1 Menu 2

    Sleep                                     1

    Wait Until Page Contains Element          xpath=//span[contains(text(), 'รายงานควบคุมสินค้าคงคลัง')]
    Page Should Contain Element               xpath=//span[contains(text(), 'รายงานควบคุมสินค้าคงคลัง')]
    Click Element                             xpath=//span[contains(text(), 'รายงานควบคุมสินค้าคงคลัง')]
    
    Sleep                                     1

    Wait Until Page Contains Element          xpath=//div/li/a[contains(text(), 'รายงานเคลื่อนไหวสินค้า')]
    Page Should Contain Element               xpath=//div/li/a[contains(text(), 'รายงานเคลื่อนไหวสินค้า')]
    Click Element                             xpath=//div/li/a[contains(text(), 'รายงานเคลื่อนไหวสินค้า')]

    Log               Check Function: 5. Menu 1 / 2                                                 console=yes
    Log               Check Element: 'Menu: รายงานเคลื่อนไหวสินค้า'                                     console=yes

Tab 1 Menu 3

    Sleep                                     1

    Wait Until Page Contains Element          xpath=//span[contains(text(), 'รายงานควบคุมสินค้าคงคลัง')]
    Page Should Contain Element               xpath=//span[contains(text(), 'รายงานควบคุมสินค้าคงคลัง')]
    Click Element                             xpath=//span[contains(text(), 'รายงานควบคุมสินค้าคงคลัง')]
    
    Sleep                                     1

    Wait Until Page Contains Element          xpath=//div/li/a[contains(text(), 'รายงานขอขยายระยะเวลาจัดเก็บ')]
    Page Should Contain Element               xpath=//div/li/a[contains(text(), 'รายงานขอขยายระยะเวลาจัดเก็บ')]
    Click Element                             xpath=//div/li/a[contains(text(), 'รายงานขอขยายระยะเวลาจัดเก็บ')]

    Log               Check Function: 6. Menu 1 / 3                                                 console=yes
    Log               Check Element: 'Menu: รายงานขอขยายระยะเวลาจัดเก็บ'                              console=yes

Tab 1 Menu 4 

    Sleep                                     1

    Wait Until Page Contains Element          xpath=//span[contains(text(), 'รายงานควบคุมสินค้าคงคลัง')]
    Page Should Contain Element               xpath=//span[contains(text(), 'รายงานควบคุมสินค้าคงคลัง')]
    Click Element                             xpath=//span[contains(text(), 'รายงานควบคุมสินค้าคงคลัง')]
    
    Sleep                                     1

    Wait Until Page Contains Element          xpath=//div/li/a[contains(text(), 'รายงานประจำงวด')]
    Page Should Contain Element               xpath=//div/li/a[contains(text(), 'รายงานประจำงวด')]
    Click Element                             xpath=//div/li/a[contains(text(), 'รายงานประจำงวด')]

    Log               Check Function: 7. Menu 1 / 4                                                 console=yes
    Log               Check Element: 'Menu: รายงานประจำงวด'                                         console=yes

Tab 2 Menu 1
    
    Sleep                                     1

    Wait Until Page Contains Element          xpath=//span[contains(text(), 'รายงานภาพถ่ายและจัดเก็บสินค้า')]
    Page Should Contain Element               xpath=//span[contains(text(), 'รายงานภาพถ่ายและจัดเก็บสินค้า')]
    Click Element                             xpath=//span[contains(text(), 'รายงานภาพถ่ายและจัดเก็บสินค้า')]
    
    Sleep                                     1

    Wait Until Page Contains Element          xpath=//div/li/a[contains(text(), 'รายงานการจัดเก็บสินค้า')]
    Page Should Contain Element               xpath=//div/li/a[contains(text(), 'รายงานการจัดเก็บสินค้า')]
    Click Element                             xpath=//div/li/a[contains(text(), 'รายงานการจัดเก็บสินค้า')]

    Log               Check Function: 8. Menu 2 / 1                                                 console=yes
    Log               Check Element: 'Menu: รายงานการจัดเก็บสินค้า'                                     console=yes

Tab 2 Menu 2
    
    Sleep                                     1

    Wait Until Page Contains Element          xpath=//span[contains(text(), 'รายงานภาพถ่ายและจัดเก็บสินค้า')]
    Page Should Contain Element               xpath=//span[contains(text(), 'รายงานภาพถ่ายและจัดเก็บสินค้า')]
    Click Element                             xpath=//span[contains(text(), 'รายงานภาพถ่ายและจัดเก็บสินค้า')]
    
    Sleep                                     1

    Wait Until Page Contains Element          xpath=//div/li/a[contains(text(), 'รายงานภาพตามพื้นที่')]
    Page Should Contain Element               xpath=//div/li/a[contains(text(), 'รายงานภาพตามพื้นที่')]
    Click Element                             xpath=//div/li/a[contains(text(), 'รายงานภาพตามพื้นที่')]

    Log               Check Function: 9. Menu 2 / 2                                                 console=yes
    Log               Check Element: 'Menu: รายงานภาพตามพื้นที่'                                        console=yes

Tab 4 Menu 1
    
    Sleep                                     1

    Wait Until Page Contains Element          xpath=//span[contains(text(), 'จัดการข้อมูล')]
    Page Should Contain Element               xpath=//span[contains(text(), 'จัดการข้อมูล')]
    Click Element                             xpath=//span[contains(text(), 'จัดการข้อมูล')]
    
    Sleep                                     1

    Wait Until Page Contains Element          xpath=//div/li/a[contains(text(), 'ประวัติการเข้าใช้งานพนักงาน')]
    Page Should Contain Element               xpath=//div/li/a[contains(text(), 'ประวัติการเข้าใช้งานพนักงาน')]
    Click Element                             xpath=//div/li/a[contains(text(), 'ประวัติการเข้าใช้งานพนักงาน')]

    Log               Check Function: 14. Menu 4 / 1                                                 console=yes
    Log               Check Element: 'Menu: ประวัติการเข้าใช้งานพนักงาน'                                  console=yes

Tab 4 Menu 2
    
    Sleep                                     1

    Wait Until Page Contains Element          xpath=//span[contains(text(), 'จัดการข้อมูล')]
    Page Should Contain Element               xpath=//span[contains(text(), 'จัดการข้อมูล')]
    Click Element                             xpath=//span[contains(text(), 'จัดการข้อมูล')]
    
    Sleep                                     1

    Wait Until Page Contains Element          xpath=//div/li/a[contains(text(), 'ประวัติการเข้าใช้บุคคลภายนอก')]
    Page Should Contain Element               xpath=//div/li/a[contains(text(), 'ประวัติการเข้าใช้บุคคลภายนอก')]
    Click Element                             xpath=//div/li/a[contains(text(), 'ประวัติการเข้าใช้บุคคลภายนอก')]

    Log               Check Function: 15. Menu 4 / 2                                                 console=yes
    Log               Check Element: 'Menu: ประวัติการเข้าใช้บุคคลภายนอก'                              console=yes

Tab 4 Menu 3
    
    Sleep                                     1

    Wait Until Page Contains Element          xpath=//span[contains(text(), 'จัดการข้อมูล')]
    Page Should Contain Element               xpath=//span[contains(text(), 'จัดการข้อมูล')]
    Click Element                             xpath=//span[contains(text(), 'จัดการข้อมูล')]
    
    Sleep                                     1

    Wait Until Page Contains Element          xpath=//div/li/a[contains(text(), 'จัดการข้อมูลผู้ใช้งานภายนอก')]
    Page Should Contain Element               xpath=//div/li/a[contains(text(), 'จัดการข้อมูลผู้ใช้งานภายนอก')]
    Click Element                             xpath=//div/li/a[contains(text(), 'จัดการข้อมูลผู้ใช้งานภายนอก')]

    Log               Check Function: 16. Menu 4 / 3                                                 console=yes
    Log               Check Element: 'Menu: จัดการข้อมูลผู้ใช้งานภายนอก'                                   console=yes

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
