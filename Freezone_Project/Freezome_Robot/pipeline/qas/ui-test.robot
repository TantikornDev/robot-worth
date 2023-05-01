*** Settings ***
Library  SeleniumLibrary
Library  RequestsLibrary
Library  OperatingSystem

Suite Teardown  Delete All Sessions

*** Variables ***

${URL}                   https://freezoneinventory-dev.pttep.com/#/dev
${BROWSER}               headlesschrome
${Submit_Button}         เข้าสู่ระบบ
${robot_login}           3aa94123-01f6-47b8-b5ef-82400f62dccbs
${page_name}             หน้าล็อกอินโรบอท | PTTEP

*** Keywords ***

Open Browser FREEZONE
    
    [Arguments]     ${URL}    ${BROWSER}

    Open Browser    ${URL}    ${BROWSER}

    Create Session       my_browser        ${URL}

    ${windowtitles}=     Get Window Titles

    Log                  Check Function: '1. Open Browser FREEZONE' ${windowtitles}    console=yes

    # Title Should Be      ${page_name}

Login

    [Arguments]     ${URL}   

    Create Session        my_browser        ${URL}

    Sleep             3

    ${element_x}    Get Element Count       xpath=//button[@id="onetrust-accept-btn-handler"]
    ${element_0}    Get Element Count       xpath=//input[@id="codeBypass"]
    ${element_1}    Get Element Count       xpath=//button[contains(text(), '${Submit_Button}')]

    Log               Check Function: Check PDPA Pop up                     console=yes
    Log               Check Element: 'Pop Up PDPA' ${element_x}             console=yes
    Log               Check Element: 'Input Secret Code' ${element_0}       console=yes
    Log               Check Element: 'Login Button' ${element_1}            console=yes

Check Tab Menu 
    
    Sleep             2

    Wait Until Page Contains Element        xpath=//div[@data-testid="dropdowns-inverntoryControlReport-display"]
    Page Should Contain Element             xpath=//div[@data-testid="dropdowns-inverntoryControlReport-display"]

    Wait Until Page Contains Element        xpath=//div[@data-testid="dropdowns-photoImageStorageReport-display"]
    Page Should Contain Element             xpath=//div[@data-testid="dropdowns-photoImageStorageReport-display"]

    Wait Until Page Contains Element        xpath=//div[@data-testid="dropdowns-wahereHouse-display"]
    Page Should Contain Element             xpath=//div[@data-testid="dropdowns-wahereHouse-display"]

    ${element_2}    Get Element Count       xpath=//div[@data-testid="dropdowns-inverntoryControlReport-display"]

    Log               Check Function: 3. Check Interface Tab Menu                                  console=yes
    Log               Check Element: 'Menu: รายงานควบคุมสินค้าคงคลัง' ${element_2}                     console=yes

   ${element_3}    Get Element Count       xpath=//div[@data-testid="dropdowns-photoImageStorageReport-display"]

    Log               Check Function: 3. Check Interface Tab Menu                                  console=yes
    Log               Check Element: 'Menu: รายงานภาพถ่ายและจัดเก็บสินค้า' ${element_3}                 console=yes

    ${element_4}    Get Element Count       xpath=//div[@data-testid="dropdowns-wahereHouse-display"]

    Log               Check Function: 3. Check Interface Tab Menu                                  console=yes
    Log               Check Element: 'Menu: พื้นที่คลังสินค้า' ${element_4}                               console=yes

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

*** Test Cases ***

Main Test
    
    Open Browser FREEZONE       ${URL}    ${BROWSER}

    Login              ${URL}

    [Teardown]        Close Browser
