*** Settings ***
Library  SeleniumLibrary
Library  RequestsLibrary
Library  OperatingSystem

Suite Teardown  Delete All Sessions

*** Variables ***

# ${URL}                 https://freezoneinventory-dev.azurewebsites.net/#/dev
${BROWSER}               headlesschrome
${Submit_Button}         เข้าสู่ระบบ
${robot_login}           3aa94123-01f6-47b8-b5ef-82400f62dccb

# Login B2C
${URL}                   https://freezoneinventory-dev.azurewebsites.net
${user_1}                freezonedev-user@gmail.com
${pass_1}                pt8SY66MrNdxp!f$

*** Keywords ***

Get Run Time

    [Arguments]     ${start_time}    ${end_time}

    ${duration}    Evaluate    ${end_time} - ${start_time}

    Log        Duration: ${duration}        console=yes

Open Browser CASHCALL
    
    [Arguments]     ${URL}    ${BROWSER}

    Open Browser    ${URL}    ${BROWSER}

    Create Session        my_browser        ${URL}

    ${windowtitles}=    Get Window Titles

    Log               Check Function: '1. Open Browser FREEZONE' ${windowtitles}    console=yes

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

LoginB2C

    [Arguments]     ${URL}

    Create Session        my_browser        ${URL}

    Sleep             1

    Wait Until Page Contains Element        xpath=//input[@id="email"]
    Input Text                              xpath=//input[@id="email"]      ${user_1}  
    Page Should Contain Element             xpath=//input[@id="email"]

    ${element_user}    Get Element Count       xpath=//input[@id="email"]

    Wait Until Page Contains Element        xpath=//input[@id="password"]
    Input Text                              xpath=//input[@id="password"]      ${pass_1} 
    Page Should Contain Element             xpath=//input[@id="password"]

    ${element_pass}    Get Element Count       xpath=//input[@id="password"]

    Wait Until Page Contains Element        xpath=//button[@id="next"]
    Click Element                           xpath=//button[@id="next"]
    Page Should Contain Element             xpath=//button[@id="next"]

    ${element_1}       Get Element Count       xpath=//button[@id="next"]

    Log               Check Function: Check PDPA Pop up                          console=yes
    Log               Check Element: 'Input Username' ${element_user}            console=yes
    Log               Check Element: 'Input Password' ${element_pass}            console=yes
    Log               Check Element: 'Login Button' ${element_1}                 console=yes

Check Tab Menu

    Sleep             1

    Wait Until Page Contains Element        xpath=//button[@id="onetrust-accept-btn-handler"]
    Page Should Contain Element             xpath=//button[@id="onetrust-accept-btn-handler"]

    ${element_pdpa_popup}       Get Element Count       xpath=//button[@id="onetrust-accept-btn-handler"]
    Log               Check Element: 'Pop Up PDPA' ${element_pdpa_popup}             console=yes

    Click Element                           xpath=//button[@id="onetrust-accept-btn-handler"]

    Sleep             1

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

# menu - รายงานสินค้าคงเหลือ
Tab 1 Menu 1

    Sleep                                     2

    Wait Until Page Contains Element          xpath=//span[contains(text(), 'รายงานควบคุมสินค้าคงคลัง')]
    Page Should Contain Element               xpath=//span[contains(text(), 'รายงานควบคุมสินค้าคงคลัง')]
    Click Element                             xpath=//span[contains(text(), 'รายงานควบคุมสินค้าคงคลัง')]
    
    Sleep                                     1

    Wait Until Page Contains Element          xpath=//div/li/a[contains(text(), 'รายงานสินค้าคงเหลือ')]
    Page Should Contain Element               xpath=//div/li/a[contains(text(), 'รายงานสินค้าคงเหลือ')]
    Click Element                             xpath=//div/li/a[contains(text(), 'รายงานสินค้าคงเหลือ')]

    Sleep                                     1

    Scroll Element Into View                  xpath=//select[@id="plant"]
 
    # search - plant
    Wait Until Page Contains Element          xpath=//select[@id="plant"]
    Page Should Contain Element               xpath=//select[@id="plant"]        
    Click Element                             xpath=//select[@id="plant"]

    Wait Until Page Contains Element          xpath=//option[@value='9901']
    Page Should Contain Element               xpath=//option[@value='9901']    
    Click Element                             xpath=//option[@value='9901']

    ${element_plant}       Get Element Count       xpath=//select[@id="plant"]

    # search - search code 
    Wait Until Page Contains Element          xpath=//input[@id="IMPORT_DOC"] 
    Input Text                                xpath=//input[@id="IMPORT_DOC"]        12345
    Page Should Contain Element               xpath=//input[@id="IMPORT_DOC"]

    ${element_IMPORT_DOC}       Get Element Count       xpath=//input[@id="IMPORT_DOC"]

    # search - material
    Wait Until Page Contains Element          xpath=//input[@id="material"] 
    Input Text                                xpath=//input[@id="material"]          12345
    Page Should Contain Element               xpath=//input[@id="material"]

    ${element_materiel}       Get Element Count       xpath=//input[@id="material"]

    # search - old materiel
    Wait Until Page Contains Element          xpath=//input[@id="olD_MAT"] 
    Input Text                                xpath=//input[@id="olD_MAT"]           12345
    Page Should Contain Element               xpath=//input[@id="olD_MAT"]

    ${element_old_materiel}       Get Element Count       xpath=//input[@id="olD_MAT"]

    # search - materiel group  
    Wait Until Page Contains Element          xpath=//input[@id="maT_GROUP"] 
    Input Text                                xpath=//input[@id="maT_GROUP"]         12345
    Page Should Contain Element               xpath=//input[@id="maT_GROUP"]
    
    ${element_materiel_group}       Get Element Count       xpath=//input[@id="maT_GROUP"]

    # search - location 
    Wait Until Page Contains Element          xpath=//input[@id="batcH_NO"] 
    Input Text                                xpath=//input[@id="batcH_NO"]          12345
    Page Should Contain Element               xpath=//input[@id="batcH_NO"]

    ${element_location}       Get Element Count       xpath=//input[@id="batcH_NO"]

    # search - search date 
    Wait Until Page Contains Element          xpath=//input[@id="date"]   
    # Click Element                             xpath=//input[@id="date"]         
    Page Should Contain Element               xpath=//input[@id="date"]

    # Sleep                                     1

    # Wait Until Page Contains Element          xpath=//span[contains(text(), '28')]
    # Click Element                             xpath=//span[contains(text(), '28')]
    # Page Should Contain Element               xpath=//span[contains(text(), '28')]

    ${element_date}       Get Element Count       xpath=//input[@id="date"]

    Sleep                                     1

    # button - search
    Wait Until Page Contains Element          xpath=//button[contains(text(), 'ค้นหา')]
    Page Should Contain Element               xpath=//button[contains(text(), 'ค้นหา')]
    Click Element                             xpath=//button[contains(text(), 'ค้นหา')]       

    ${element_search_button}       Get Element Count       xpath=//button[contains(text(), 'ค้นหา')]
  
    Sleep                                     1

    # # button - export
    # Wait Until Page Contains Element          xpath=//div[@class="col-span-12 md:col-span-4 text-right pr-2"]/button
    # Page Should Contain Element               xpath=//div[@class="col-span-12 md:col-span-4 text-right pr-2"]/button
    # Click Element                             xpath=//div[@class="col-span-12 md:col-span-4 text-right pr-2"]/button

    ${element_export_button}       Get Element Count       xpath=//div[@class="col-span-12 md:col-span-4 text-right pr-2"]/button

    Sleep                                     1

    # button - clear
    Wait Until Page Contains Element          xpath=//button[contains(text(), 'ล้างทั้งหมด')]
    Page Should Contain Element               xpath=//button[contains(text(), 'ล้างทั้งหมด')]
    Click Element                             xpath=//button[contains(text(), 'ล้างทั้งหมด')]

    ${element_clear_button}       Get Element Count       xpath=//button[contains(text(), 'ล้างทั้งหมด')]

    Log               Check Function: Check Tab 1 Menu 1                                      console=yes
    Log               Check Element: 'Input Plant' ${element_plant}                           console=yes
    Log               Check Element: 'Input Invoice' ${element_IMPORT_DOC}                    console=yes
    Log               Check Element: 'Input Materiel' ${element_materiel}                     console=yes
    Log               Check Element: 'Input Old Materiel' ${element_old_materiel}            console=yes
    Log               Check Element: 'Input Materiel Group' ${element_materiel_group}         console=yes
    Log               Check Element: 'Input Location' ${element_location}                     console=yes
    Log               Check Element: 'Input Date' ${element_date}                             console=yes
    Log               Check Element: 'Search Button' ${element_search_button}                 console=yes
    Log               Check Element: 'Export Button' ${element_export_button}                 console=yes
    Log               Check Element: 'Clear Button' ${element_clear_button}                   console=yes

# menu - รายงานความเคลื่อนไหว
Tab 1 Menu 2

    Sleep                                     2

    Wait Until Page Contains Element          xpath=//span[contains(text(), 'รายงานควบคุมสินค้าคงคลัง')]
    Page Should Contain Element               xpath=//span[contains(text(), 'รายงานควบคุมสินค้าคงคลัง')]
    Click Element                             xpath=//span[contains(text(), 'รายงานควบคุมสินค้าคงคลัง')]
    
    Sleep                                     1

    Wait Until Page Contains Element          xpath=//div/li/a[contains(text(), 'รายงานเคลื่อนไหวสินค้า')]
    Page Should Contain Element               xpath=//div/li/a[contains(text(), 'รายงานเคลื่อนไหวสินค้า')]
    Click Element                             xpath=//div/li/a[contains(text(), 'รายงานเคลื่อนไหวสินค้า')]

    Sleep                                     1

    Scroll Element Into View                  xpath=//select[@id="plant"]
 
    # search - plant
    Wait Until Page Contains Element          xpath=//select[@id="plant"]
    Page Should Contain Element               xpath=//select[@id="plant"]        
    Click Element                             xpath=//select[@id="plant"]

    Wait Until Page Contains Element          xpath=//option[@value='9901']
    Page Should Contain Element               xpath=//option[@value='9901']    
    Click Element                             xpath=//option[@value='9901']

    ${element_plant}       Get Element Count       xpath=//select[@id="plant"]

    # search - invoice
    Wait Until Page Contains Element          xpath=//input[@name="invoice"]
    Input Text                                xpath=//input[@name="invoice"]            12345
    Page Should Contain Element               xpath=//input[@name="invoice"]

    ${element_invoice}       Get Element Count       xpath=//input[@id="invoice"]

    # search - details 
    Wait Until Page Contains Element          xpath=//input[@name="material"] 
    Input Text                                xpath=//input[@name="material"]           12345
    Page Should Contain Element               xpath=//input[@name="material"] 

    ${element_details}       Get Element Count       xpath=//input[@id="material"]

    # search - date from
    Wait Until Page Contains Element          xpath=//div[@class="grid grid-cols-12 gap-4"]/div[4]/div/div[2]/div/input[@id="date"]
    Page Should Contain Element               xpath=//div[@class="grid grid-cols-12 gap-4"]/div[4]/div/div[2]/div/input[@id="date"]
    # Click Element                             xpath=//div[@class="grid grid-cols-12 gap-4"]/div[4]/div/div[2]/div/input[@id="date"]
    
    ${element_date_from}       Get Element Count       xpath=//div[@class="grid grid-cols-12 gap-4"]/div[4]/div/div[2]/div/input[@id="date"]

    Sleep                                     1

    # search - date from
    Wait Until Page Contains Element          xpath=//div[@class="grid grid-cols-12 gap-4"]/div[5]/div/div[2]/div/input[@id="date"]
    Page Should Contain Element               xpath=//div[@class="grid grid-cols-12 gap-4"]/div[5]/div/div[2]/div/input[@id="date"]
    # Click Element                             xpath=//div[@class="grid grid-cols-12 gap-4"]/div[5]/div/div[2]/div/input[@id="date"]

    ${element_date_to}       Get Element Count       xpath=//div[@class="grid grid-cols-12 gap-4"]/div[5]/div/div[2]/div/input[@id="date"]
    
    Sleep                                     1

    # button - search
    Wait Until Page Contains Element          xpath=//button[contains(text(), 'ค้นหา')]
    Page Should Contain Element               xpath=//button[contains(text(), 'ค้นหา')]
    Click Element                             xpath=//button[contains(text(), 'ค้นหา')]  

    ${element_search_button}       Get Element Count       xpath=//button[contains(text(), 'ค้นหา')]
       
    Sleep                                     1

    # button - export
    # Wait Until Page Contains Element          xpath=//div[@class="col-span-12 md:col-span-4 text-right pr-2"]/button
    # Page Should Contain Element               xpath=//div[@class="col-span-12 md:col-span-4 text-right pr-2"]/button
    # # Click Element                             xpath=//div[@class="col-span-12 md:col-span-4 text-right pr-2"]/button

    # ${element_export_button}       Get Element Count       xpath=//div[@class="col-span-12 md:col-span-4 text-right pr-2"]/button

    Sleep                                     1

    # button - clear
    Wait Until Page Contains Element          xpath=//button[contains(text(), 'ล้างทั้งหมด')]
    Page Should Contain Element               xpath=//button[contains(text(), 'ล้างทั้งหมด')]
    Click Element                             xpath=//button[contains(text(), 'ล้างทั้งหมด')]

    ${element_clear_button}       Get Element Count       xpath=//button[contains(text(), 'ล้างทั้งหมด')]

    Sleep                                     1

    Log               ----------------------------------------------------                    console=yes
    Log               Check Function: Check Tab 1 Menu 2                                      console=yes
    Log               Check Element: 'Input Plant' ${element_plant}                           console=yes
    Log               Check Element: 'Input Invoice' ${element_invoice}                       console=yes
    Log               Check Element: 'Input Detail' ${element_details}                        console=yes
    Log               Check Element: 'Input Date From' ${element_date_from}                   console=yes
    Log               Check Element: 'Input Date To' ${element_date_to}                       console=yes
    Log               Check Element: 'Search Button' ${element_search_button}                 console=yes
    # Log               Check Element: 'Export Button' ${element_export_button}                 console=yes
    Log               Check Element: 'Clear Button' ${element_clear_button}                   console=yes

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
    
    Open Browser CASHCALL       ${URL}    ${BROWSER}

    LoginB2C                    ${URL}

    Check Tab Menu
    
    Tab 1 Menu 1

    Tab 1 Menu 2

    [Teardown]        Close Browser
