*** Settings ***
Library  SeleniumLibrary
Library  RequestsLibrary
Library  OperatingSystem
Library  String
Library  Collections

Suite Teardown  Delete All Sessions

*** Variables ***

# Config - Open Browse 
${URL}                   https://freezoneinventory-dev.pttep.com/#/dev
${BROWSER}               headlesschrome

# Config - Login Page
${Submit_Button}         เข้าสู่ระบบ
${robot_login}           3aa94123-01f6-47b8-b5ef-82400f62dccb

*** Test Cases ***

Main Test
    
    Open Browser FREEZONE       ${URL}    ${BROWSER}

    Login              ${URL}

    Check Page Resource

    Check Tab Menu 

    Tab 1 Menu 1

    Tab 1 Menu 2

    Tab 1 Menu 3 

    Tab 1 Menu 4 

    Tab 1 Menu 4 - Tab 1

    Tab 1 Menu 4 - Tab 2

    Tab 1 Menu 4 - Tab 3

    Tab 2 Menu 1

    Tab 2 Menu 2

    Tab 3 Menu 1

    Tab 3 Menu 2

    Tab 3 Menu 3

    Tab 3 Menu 4

    Logout

    [Teardown]        Close Browser

*** Keywords ***

Open Browser FREEZONE
    
    [Arguments]     ${URL}    ${BROWSER}

    Open Browser    ${URL}    ${BROWSER}

    ${windowtitles}=    Get Window Titles

    Title Should Be    หน้าล็อกอินโรบอท | PTTEP

    Log               Check Function: '1. Open Browser FREEZONE' ${windowtitles}    console=yes

Login

    [Arguments]     ${URL}

    Create Session        my_browser        ${URL}

    Sleep             2

    ${element_x}    Get Element Count       xpath=//button[@id="onetrust-accept-btn-handler"]
    ${element_0}    Get Element Count       xpath=//input[@id="codeBypass"]
    ${element_1}    Get Element Count       xpath=//button[contains(text(), '${Submit_Button}')]

    Log               Check Function: Check Login Page                      console=yes
    Log               Check Element: 'Pop Up PDPA' ${element_x}             console=yes
    Log               Check Element: 'Input Secret Code' ${element_0}       console=yes
    Log               Check Element: 'Login Button' ${element_1}            console=yes

    Sleep             1

    Wait Until Page Contains Element        xpath=//button[@id="onetrust-accept-btn-handler"]
    Page Should Contain Element             xpath=//button[@id="onetrust-accept-btn-handler"]
    Click Element                           xpath=//button[@id="onetrust-accept-btn-handler"]
    
    Sleep             1

    Wait Until Page Contains Element        xpath=//input[@id="codeBypass"]
    Page Should Contain Element             xpath=//input[@id="codeBypass"]
    Input Text                              xpath=//input[@id="codeBypass"]      ${robot_login}

    Sleep             1

    Wait Until Page Contains Element        xpath=//button[contains(text(), '${Submit_Button}')]
    Page Should Contain Element             xpath=//button[contains(text(), '${Submit_Button}')]
    Click Element                           xpath=//button[contains(text(), '${Submit_Button}')]
    
    Sleep             1

Check Page Resource

    Sleep             2    
    
    ${windowtitles}=    Get Window Titles

    ${windowhandles}=    Get Window Handles

    Log        'Window Titles'${windowtitles}        console=yes

    Log        'Window Handles'${windowhandles}        console=yes

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

    Log               Check Function: 3. Check Interface Tab Menu                                  console=yes
    Log               Check Element: 'Menu: รายงานควบคุมสินค้าคงคลัง' ${element_2}                     console=yes

    Log               Check Function: 3. Check Interface Tab Menu                                  console=yes
    Log               Check Element: 'Menu: รายงานภาพถ่ายและจัดเก็บสินค้า' ${element_3}                 console=yes

    Log               Check Function: 3. Check Interface Tab Menu                                  console=yes
    Log               Check Element: 'Menu: พื้นที่คลังสินค้า' ${element_4}                               console=yes

Logout

    Sleep             1    

    Wait Until Page Contains Element        xpath=//div[@data-testid="flowbite-avatar-img"]
    Page Should Contain Element             xpath=//div[@data-testid="flowbite-avatar-img"]

    ${element_x}    Get Element Count       xpath=//div[@data-testid="flowbite-avatar-img"]

    Log               Check Function: . Check Log out                                        console=yes
    Log               Check Element: 'Img Log out' ${element_x}                               console=yes

    Click Element                           xpath=//div[@data-testid="flowbite-avatar-img"]

    Wait Until Page Contains Element        xpath=//div/div/div[@data-testid="dropdowns-language-display"]/ul/div[@data-testid="flowbite-tooltip"]/div/ul/div/li[contains(text(), 'ออกจากระบบ')]
    Page Should Contain Element             xpath=//div/div/div[@data-testid="dropdowns-language-display"]/ul/div[@data-testid="flowbite-tooltip"]/div/ul/div/li[contains(text(), 'ออกจากระบบ')]

    ${element_y}    Get Element Count       xpath=//div/div/div[@data-testid="dropdowns-language-display"]/ul/div[@data-testid="flowbite-tooltip"]/div/ul/div/li[contains(text(), 'ออกจากระบบ')]

    Log               Check Function: . Check Log out                                        console=yes
    Log               Check Element: 'Log out Button' ${element_y}                            console=yes

    Click Element                           xpath=//div/div/div[@data-testid="dropdowns-language-display"]/ul/div[@data-testid="flowbite-tooltip"]/div/ul/div/li[contains(text(), 'ออกจากระบบ')]                    

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

    Sleep                                     2

    Scroll Element Into View                  xpath=//div/span[contains(text(), 'รายงานสินค้าคงเหลือ')]
 
    # search - plant
    Wait Until Page Contains Element          xpath=//select[@id="plant"]
    Page Should Contain Element               xpath=//select[@id="plant"]        
    Click Element                             xpath=//select[@id="plant"]

    Wait Until Page Contains Element          xpath=//option[@value='9901']
    Page Should Contain Element               xpath=//option[@value='9901']    
    Click Element                             xpath=//option[@value='9901']

    # search - search code 
    Wait Until Page Contains Element          xpath=//input[@id="imporT_DOC"] 
    Input Text                                xpath=//input[@id="imporT_DOC"]        12345
    Page Should Contain Element               xpath=//input[@id="imporT_DOC"]

    # search - search info 
    Wait Until Page Contains Element          xpath=//input[@id="material"] 
    Input Text                                xpath=//input[@id="material"]          12345
    Page Should Contain Element               xpath=//input[@id="material"]

    # search - search project 
    Wait Until Page Contains Element          xpath=//input[@id="olD_MAT"] 
    Input Text                                xpath=//input[@id="olD_MAT"]           12345
    Page Should Contain Element               xpath=//input[@id="olD_MAT"]

    # search - search  
    Wait Until Page Contains Element          xpath=//input[@id="maT_GROUP"] 
    Input Text                                xpath=//input[@id="maT_GROUP"]         12345
    Page Should Contain Element               xpath=//input[@id="maT_GROUP"]

    # search - search location 
    Wait Until Page Contains Element          xpath=//input[@id="batcH_NO"] 
    Input Text                                xpath=//input[@id="batcH_NO"]          12345
    Page Should Contain Element               xpath=//input[@id="batcH_NO"]

    # search - search date 
    Wait Until Page Contains Element          xpath=//div[@data-testid="date-start-picker"]/div/button[2]
    Click Element                             xpath=//div[@data-testid="date-start-picker"]/div/button[2]
    Page Should Contain Element               xpath=//div[@data-testid="date-start-picker"]/div/button[2]

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

    Sleep                                     1

    # button - search
    Wait Until Page Contains Element          xpath=//button[contains(text(), 'ค้นหา')]
    Page Should Contain Element               xpath=//button[contains(text(), 'ค้นหา')]
    # Click Element                             xpath=//button[contains(text(), 'ค้นหา')]         

    Sleep                                     1

    # # button - export
    # Wait Until Page Contains Element          xpath=//div[@class="col-span-12 md:col-span-4 text-right pr-2"]/button
    # Page Should Contain Element               xpath=//div[@class="col-span-12 md:col-span-4 text-right pr-2"]/button
    # Click Element                             xpath=//div[@class="col-span-12 md:col-span-4 text-right pr-2"]/button

    Sleep                                     1

    # button - clear
    Wait Until Page Contains Element          xpath=//button[contains(text(), 'ล้างทั้งหมด')]
    Page Should Contain Element               xpath=//button[contains(text(), 'ล้างทั้งหมด')]
    Click Element                             xpath=//button[contains(text(), 'ล้างทั้งหมด')]

    Log               Check Function: 4. Menu 1 Sub Menu 1                                       console=yes

# menu - รายงานคความเคลื่อนไหว
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

    Scroll Element Into View                  xpath=//div/span[contains(text(), 'รายงานเคลื่อนไหวสินค้า')]
 
    # search - plant
    Wait Until Page Contains Element          xpath=//select[@id="plant"]
    Page Should Contain Element               xpath=//select[@id="plant"]        
    Click Element                             xpath=//select[@id="plant"]

    Wait Until Page Contains Element          xpath=//option[@value='9901']
    Page Should Contain Element               xpath=//option[@value='9901']    
    Click Element                             xpath=//option[@value='9901']

    # search - invoice
    Wait Until Page Contains Element          xpath=//input[@name="invoice"]
    # Input Text                                xpath=//input[@name="invoice"]            12345
    Page Should Contain Element               xpath=//input[@name="invoice"]

    # search - details 
    Wait Until Page Contains Element          xpath=//input[@name="material"] 
    # Input Text                                xpath=//input[@name="material"]           12345
    Page Should Contain Element               xpath=//input[@name="material"] 

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

    Sleep                                     2

    # search - date to
    Wait Until Page Contains Element          xpath=//div[@data-testid="date-end-picker"]/div/button[2]
    Page Should Contain Element               xpath=//div[@data-testid="date-end-picker"]/div/button[2]
    Click Element                             xpath=//div[@data-testid="date-end-picker"]/div/button[2]
    
    Sleep                                     1

    # button - search
    Wait Until Page Contains Element          xpath=//button[contains(text(), 'ค้นหา')]
    Page Should Contain Element               xpath=//button[contains(text(), 'ค้นหา')]
    # Click Element                             xpath=//button[contains(text(), 'ค้นหา')]         

    # Sleep                                     1

    # button - export
    Wait Until Page Contains Element          xpath=//button[@data-testid="buttons-clear"]
    Page Should Contain Element               xpath=//button[@data-testid="buttons-clear"]
    # Click Element                             xpath=//button[@data-testid="buttons-clear"]

    Sleep                                     1

    # button - clear
    Wait Until Page Contains Element          xpath=//button[contains(text(), 'ล้างทั้งหมด')]
    Page Should Contain Element               xpath=//button[contains(text(), 'ล้างทั้งหมด')]
    Click Element                             xpath=//button[contains(text(), 'ล้างทั้งหมด')]

    Sleep                                     1

    Log               Check Function: 5. Menu 1 Sub Menu 2                                       console=yes

# menu - รายงานขอขยายระยะเวลาจัดเก็บ
Tab 1 Menu 3

    Sleep                                     2

    Wait Until Page Contains Element          xpath=//span[contains(text(), 'รายงานควบคุมสินค้าคงคลัง')]
    Page Should Contain Element               xpath=//span[contains(text(), 'รายงานควบคุมสินค้าคงคลัง')]
    Click Element                             xpath=//span[contains(text(), 'รายงานควบคุมสินค้าคงคลัง')]
    
    Sleep                                     1

    Wait Until Page Contains Element          xpath=//div/li/a[contains(text(), 'รายงานขอขยายระยะเวลาจัดเก็บ')]
    Page Should Contain Element               xpath=//div/li/a[contains(text(), 'รายงานขอขยายระยะเวลาจัดเก็บ')]
    Click Element                             xpath=//div/li/a[contains(text(), 'รายงานขอขยายระยะเวลาจัดเก็บ')]

    Sleep                                     1

    Scroll Element Into View                  xpath=//div/span[contains(text(), 'รายงานขอขยายระยะเวลาจัดเก็บ')]

    # search - select year
    Wait Until Page Contains Element          xpath=//select[@id="selectYears"]
    Click Element                             xpath=//select[@id="selectYears"]
    Page Should Contain Element               xpath=//select[@id="selectYears"]

    Sleep                                     1

    Wait Until Page Contains Element          xpath=//option[@value="1/2565"]
    Page Should Contain Element               xpath=//option[@value="1/2565"]
    Click Element                             xpath=//option[@value="1/2565"]

    Sleep                                     1

    # search - plant 
    Wait Until Page Contains Element          xpath=//select[@id="plant"]
    Page Should Contain Element               xpath=//select[@id="plant"]        
    Click Element                             xpath=//select[@id="plant"]

    Wait Until Page Contains Element          xpath=//option[@value='9901']
    Page Should Contain Element               xpath=//option[@value='9901']    
    Click Element                             xpath=//option[@value='9901']

    # search - document
    Wait Until Page Contains Element          xpath=//input[@id="document"] 
    # Input Text                                xpath=//input[@id="document"]           12345
    Page Should Contain Element               xpath=//input[@id="document"] 

    # search - material
    Wait Until Page Contains Element          xpath=//input[@id="material"] 
    # Input Text                                xpath=//input[@id="material"]           12345
    Page Should Contain Element               xpath=//input[@id="material"] 

    # search - material
    Wait Until Page Contains Element          xpath=//input[@id="oldmat"] 
    # Input Text                                xpath=//input[@id="oldmat"]           12345
    Page Should Contain Element               xpath=//input[@id="oldmat"] 

    # button - search
    Wait Until Page Contains Element          xpath=//button[contains(text(), 'ค้นหา')]
    Page Should Contain Element               xpath=//button[contains(text(), 'ค้นหา')]
    # Click Element                             xpath=//button[contains(text(), 'ค้นหา')]         

    # Sleep                                     2

    # # check record display
    # Wait Until Page Contains Element          xpath=//tr[@class="bg-white whitespace-nowrap"]
    # Page Should Contain Element               xpath=//tr[@class="bg-white whitespace-nowrap"]

    # button - export
    # Wait Until Page Contains Element          xpath=//div[@class="col-span-12 md:col-span-4 text-right pr-2"]/button
    # Page Should Contain Element               xpath=//div[@class="col-span-12 md:col-span-4 text-right pr-2"]/button
    # Click Element                             xpath=//div[@class="col-span-12 md:col-span-4 text-right pr-2"]/button

    # button - clear
    Wait Until Page Contains Element          xpath=//button[contains(text(), 'ล้างทั้งหมด')]
    Page Should Contain Element               xpath=//button[contains(text(), 'ล้างทั้งหมด')]
    Click Element                             xpath=//button[contains(text(), 'ล้างทั้งหมด')]

    Sleep                                     1

    Log               Check Function: 6. Menu 1 Sub Menu 3                                      console=yes

# menu - รายงานตามงวด
Tab 1 Menu 4 

    Sleep                                     2

    Wait Until Page Contains Element          xpath=//span[contains(text(), 'รายงานควบคุมสินค้าคงคลัง')]
    Page Should Contain Element               xpath=//span[contains(text(), 'รายงานควบคุมสินค้าคงคลัง')]
    Click Element                             xpath=//span[contains(text(), 'รายงานควบคุมสินค้าคงคลัง')]
    
    Sleep                                     1

    Wait Until Page Contains Element          xpath=//div/li/a[contains(text(), 'รายงานประจำงวด')]
    Page Should Contain Element               xpath=//div/li/a[contains(text(), 'รายงานประจำงวด')]
    Click Element                             xpath=//div/li/a[contains(text(), 'รายงานประจำงวด')]

    Log               Check Function: 7. Menu 1 Sub Menu 4                                       console=yes

Tab 1 Menu 4 - Tab 1

    Sleep                                     1

    Scroll Element Into View                  xpath=//h2/span[contains(text(), 'รายงานสินค้าคงเหลือ')]

    # search - select plant 
    Wait Until Page Contains Element          xpath=//div[@data-testid="flowbite-accordion-content"][1]/div/div[2]/div/div/div/select[@id="selectPlants"]
    Page Should Contain Element               xpath=//div[@data-testid="flowbite-accordion-content"][1]/div/div[2]/div/div/div/select[@id="selectPlants"]
    Click Element                             xpath=//div[@data-testid="flowbite-accordion-content"][1]/div/div[2]/div/div/div/select[@id="selectPlants"]

    Sleep                                     1

    Wait Until Page Contains Element          xpath=//div[@data-testid="flowbite-accordion-content"][1]/div/div[2]/div/div/div/select/option[@value='9901']
    Page Should Contain Element               xpath=//div[@data-testid="flowbite-accordion-content"][1]/div/div[2]/div/div/div/select/option[@value='9901']
    Click Element                             xpath=//div[@data-testid="flowbite-accordion-content"][1]/div/div[2]/div/div/div/select/option[@value='9901']

    # search - select year 
    Wait Until Page Contains Element          xpath=//div[@data-testid="flowbite-accordion-content"][1]/div/div[3]/div/div/div/select[@id="selectYears"]
    Page Should Contain Element               xpath=//div[@data-testid="flowbite-accordion-content"][1]/div/div[3]/div/div/div/select[@id="selectYears"]
    Click Element                             xpath=//div[@data-testid="flowbite-accordion-content"][1]/div/div[3]/div/div/div/select[@id="selectYears"]

    Sleep                                     1

    Wait Until Page Contains Element          xpath=//div[@data-testid="flowbite-accordion-content"][1]/div/div[3]/div/div/div/select/option[@value='2023']
    Page Should Contain Element               xpath=//div[@data-testid="flowbite-accordion-content"][1]/div/div[3]/div/div/div/select/option[@value='2023']
    Click Element                             xpath=//div[@data-testid="flowbite-accordion-content"][1]/div/div[3]/div/div/div/select/option[@value='2023']

    Sleep                                     1

    Wait Until Page Contains Element          xpath=//div[@data-testid="flowbite-accordion-content"][1]/div[2]/table/tbody/tr[1]/th[4]/button
    Page Should Contain Element               xpath=//div[@data-testid="flowbite-accordion-content"][1]/div[2]/table/tbody/tr[1]/th[4]/button
    # Click Element                             xpath=//div[@data-testid="flowbite-accordion-content"][1]/div[2]/table/tbody/tr[1]/th[4]/button

    Sleep                                     1

    Wait Until Page Contains Element          xpath=//div[@data-testid="flowbite-accordion-content"][1]/div[2]/table/tbody/tr[1]/th[5]/button
    Page Should Contain Element               xpath=//div[@data-testid="flowbite-accordion-content"][1]/div[2]/table/tbody/tr[1]/th[5]/button
    # Click Element                             xpath=//div[@data-testid="flowbite-accordion-content"][1]/div[2]/table/tbody/tr[1]/th[5]/button

    Sleep                                     1

    Wait Until Page Contains Element          xpath=//div[@data-testid="flowbite-accordion-content"][1]/div[2]/table/tbody/tr[2]/th[4]/button
    Page Should Contain Element               xpath=//div[@data-testid="flowbite-accordion-content"][1]/div[2]/table/tbody/tr[2]/th[4]/button
    # Click Element                             xpath=//div[@data-testid="flowbite-accordion-content"][1]/div[2]/table/tbody/tr[2]/th[4]/button

    Sleep                                     1

    Wait Until Page Contains Element          xpath=//div[@data-testid="flowbite-accordion-content"][1]/div[2]/table/tbody/tr[2]/th[5]/button
    Page Should Contain Element               xpath=//div[@data-testid="flowbite-accordion-content"][1]/div[2]/table/tbody/tr[2]/th[5]/button
    # Click Element                             xpath=//div[@data-testid="flowbite-accordion-content"][1]/div[2]/table/tbody/tr[2]/th[5]/button

    Sleep                                     1
    
    Click Element                             xpath=//button/h2/span[contains(text(), 'รายงานสินค้าคงเหลือ')]

    Sleep                                     1

    Log               Check Function: 7.1 Menu 1 Sub Menu 4 - 1                                      console=yes

Tab 1 Menu 4 - Tab 2

    Sleep                                     1

    Scroll Element Into View                  xpath=//h2/span[contains(text(), 'รายงานเคลื่อนไหวสินค้า')]

    Sleep                                     1
    
    Click Element                             xpath=//button/h2/span[contains(text(), 'รายงานเคลื่อนไหวสินค้า')]

    Sleep                                     1

    # search - select plant 
    Wait Until Page Contains Element          xpath=//div[@data-testid="flowbite-accordion-content"][2]/div/div[2]/div/div/div/select[@id="selectPlants"]
    Page Should Contain Element               xpath=//div[@data-testid="flowbite-accordion-content"][2]/div/div[2]/div/div/div/select[@id="selectPlants"]
    Click Element                             xpath=//div[@data-testid="flowbite-accordion-content"][2]/div/div[2]/div/div/div/select[@id="selectPlants"]

    Sleep                                     1

    Wait Until Page Contains Element          xpath=//div[@data-testid="flowbite-accordion-content"][2]/div/div[2]/div/div/div/select/option[@value='9901']
    Page Should Contain Element               xpath=//div[@data-testid="flowbite-accordion-content"][2]/div/div[2]/div/div/div/select/option[@value='9901']
    Click Element                             xpath=//div[@data-testid="flowbite-accordion-content"][2]/div/div[2]/div/div/div/select/option[@value='9901']

    # search - select year 
    Wait Until Page Contains Element          xpath=//div[@data-testid="flowbite-accordion-content"][2]/div/div[3]/div/div/div/select[@id="selectYears"]
    Page Should Contain Element               xpath=//div[@data-testid="flowbite-accordion-content"][2]/div/div[3]/div/div/div/select[@id="selectYears"]
    Click Element                             xpath=//div[@data-testid="flowbite-accordion-content"][2]/div/div[3]/div/div/div/select[@id="selectYears"]

    Sleep                                     1

    Wait Until Page Contains Element          xpath=//div[@data-testid="flowbite-accordion-content"][2]/div/div[3]/div/div/div/select/option[@value='2023']
    Page Should Contain Element               xpath=//div[@data-testid="flowbite-accordion-content"][2]/div/div[3]/div/div/div/select/option[@value='2023']
    Click Element                             xpath=//div[@data-testid="flowbite-accordion-content"][2]/div/div[3]/div/div/div/select/option[@value='2023']

    Sleep                                     1

    Wait Until Page Contains Element          xpath=//div[@data-testid="flowbite-accordion-content"][2]/div[2]/table/tbody/tr[1]/th[4]/button
    Page Should Contain Element               xpath=//div[@data-testid="flowbite-accordion-content"][2]/div[2]/table/tbody/tr[1]/th[4]/button
    # Click Element                             xpath=//div[@data-testid="flowbite-accordion-content"][2]/div[2]/table/tbody/tr[1]/th[4]/button

    Sleep                                     1

    Wait Until Page Contains Element          xpath=//div[@data-testid="flowbite-accordion-content"][2]/div[2]/table/tbody/tr[1]/th[5]/button
    Page Should Contain Element               xpath=//div[@data-testid="flowbite-accordion-content"][2]/div[2]/table/tbody/tr[1]/th[5]/button
    # Click Element                             xpath=//div[@data-testid="flowbite-accordion-content"][2]/div[2]/table/tbody/tr[1]/th[5]/button

    Sleep                                     1

    Wait Until Page Contains Element          xpath=//div[@data-testid="flowbite-accordion-content"][2]/div[2]/table/tbody/tr[2]/th[4]/button
    Page Should Contain Element               xpath=//div[@data-testid="flowbite-accordion-content"][2]/div[2]/table/tbody/tr[2]/th[4]/button
    # Click Element                             xpath=//div[@data-testid="flowbite-accordion-content"][2]/div[2]/table/tbody/tr[2]/th[4]/button

    Sleep                                     1

    Wait Until Page Contains Element          xpath=//div[@data-testid="flowbite-accordion-content"][2]/div[2]/table/tbody/tr[2]/th[5]/button
    Page Should Contain Element               xpath=//div[@data-testid="flowbite-accordion-content"][2]/div[2]/table/tbody/tr[2]/th[5]/button
    # Click Element                             xpath=//div[@data-testid="flowbite-accordion-content"][2]/div[2]/table/tbody/tr[2]/th[5]/button

    Sleep                                     1
    
    Click Element                             xpath=//button/h2/span[contains(text(), 'รายงานเคลื่อนไหวสินค้า')]

    Sleep                                     1

    Log               Check Function: 7.2 Menu 1 Sub Menu 4 - 2                                      console=yes

Tab 1 Menu 4 - Tab 3

    Sleep                                     1

    Scroll Element Into View                  xpath=//h2/span[contains(text(), 'รายงานขอขยายระยะเวลาจัดเก็บ')]
    
    Sleep                                     1

    Click Element                             xpath=//button/h2/span[contains(text(), 'รายงานขอขยายระยะเวลาจัดเก็บ')]

    Sleep                                     1

    Scroll Element Into View                  xpath=//div[@data-testid="flowbite-accordion-content"][3]/div/div[2]/div/div/div/select[@id="selectPlants"]

    Sleep                                     1

    # search - select plant 
    Wait Until Page Contains Element          xpath=//div[@data-testid="flowbite-accordion-content"][3]/div/div[2]/div/div/div/select[@id="selectPlants"]
    Page Should Contain Element               xpath=//div[@data-testid="flowbite-accordion-content"][3]/div/div[2]/div/div/div/select[@id="selectPlants"]
    Click Element                             xpath=//div[@data-testid="flowbite-accordion-content"][3]/div/div[2]/div/div/div/select[@id="selectPlants"]

    Sleep                                     1

    Wait Until Page Contains Element          xpath=//div[@data-testid="flowbite-accordion-content"][3]/div/div[2]/div/div/div/select/option[@value='9901']
    Page Should Contain Element               xpath=//div[@data-testid="flowbite-accordion-content"][3]/div/div[2]/div/div/div/select/option[@value='9901']
    Click Element                             xpath=//div[@data-testid="flowbite-accordion-content"][3]/div/div[2]/div/div/div/select/option[@value='9901']

    # search - select year 
    Wait Until Page Contains Element          xpath=//div[@data-testid="flowbite-accordion-content"][3]/div/div[3]/div/div/div/select[@id="selectYears"]
    Page Should Contain Element               xpath=//div[@data-testid="flowbite-accordion-content"][3]/div/div[3]/div/div/div/select[@id="selectYears"]
    Click Element                             xpath=//div[@data-testid="flowbite-accordion-content"][3]/div/div[3]/div/div/div/select[@id="selectYears"]

    Sleep                                     1

    Wait Until Page Contains Element          xpath=//div[@data-testid="flowbite-accordion-content"][3]/div/div[3]/div/div/div/select/option[@value='2023']
    Page Should Contain Element               xpath=//div[@data-testid="flowbite-accordion-content"][3]/div/div[3]/div/div/div/select/option[@value='2023']
    Click Element                             xpath=//div[@data-testid="flowbite-accordion-content"][3]/div/div[3]/div/div/div/select/option[@value='2023']

    Sleep                                     1

    Wait Until Page Contains Element          xpath=//div[@data-testid="flowbite-accordion-content"][3]/div[2]/table/tbody/tr[1]/th[4]/button
    Page Should Contain Element               xpath=//div[@data-testid="flowbite-accordion-content"][3]/div[2]/table/tbody/tr[1]/th[4]/button
    # Click Element                             xpath=//div[@data-testid="flowbite-accordion-content"][3]/div[2]/table/tbody/tr[1]/th[4]/button

    Sleep                                     1

    Wait Until Page Contains Element          xpath=//div[@data-testid="flowbite-accordion-content"][3]/div[2]/table/tbody/tr[1]/th[5]/button
    Page Should Contain Element               xpath=//div[@data-testid="flowbite-accordion-content"][3]/div[2]/table/tbody/tr[1]/th[5]/button
    # Click Element                             xpath=//div[@data-testid="flowbite-accordion-content"][3]/div[2]/table/tbody/tr[1]/th[5]/button

    Sleep                                     1

    Wait Until Page Contains Element          xpath=//div[@data-testid="flowbite-accordion-content"][3]/div[2]/table/tbody/tr[2]/th[4]/button
    Page Should Contain Element               xpath=//div[@data-testid="flowbite-accordion-content"][3]/div[2]/table/tbody/tr[2]/th[4]/button
    # Click Element                             xpath=//div[@data-testid="flowbite-accordion-content"][3]/div[2]/table/tbody/tr[2]/th[4]/button

    Sleep                                     1

    Wait Until Page Contains Element          xpath=//div[@data-testid="flowbite-accordion-content"][3]/div[2]/table/tbody/tr[2]/th[5]/button
    Page Should Contain Element               xpath=//div[@data-testid="flowbite-accordion-content"][3]/div[2]/table/tbody/tr[2]/th[5]/button
    # Click Element                             xpath=//div[@data-testid="flowbite-accordion-content"][3]/div[2]/table/tbody/tr[2]/th[5]/button

    Log               Check Function: 7.3 Menu 1 Sub Menu 4 - 3                                      console=yes

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
    # Click Element                             xpath=//button[contains(text(), 'ค้นหา')]     

    # Sleep                                     3

    # Scroll Element Into View                  xpath=//div[@data-testid="pageNavigation-display"]

    # Sleep                                     2

    # Wait Until Page Contains Element          xpath=//div[@class="grid grid-cols-12"]/div
    # Page Should Contain Element               xpath=//div[@class="grid grid-cols-12"]/div

    ${element_7}    Get Element Count         xpath=//div[@class="grid grid-cols-12"]/div
    Log             Check Element: '8 Menu 2 Sub Menu 1 - Picture 1' ${element_7}                               console=yes
    
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

    Wait Until Page Contains Element          xpath=//option[contains(text(), 'GROUND')]
    Page Should Contain Element               xpath=//option[contains(text(), 'GROUND')]
    Click Element                             xpath=//option[contains(text(), 'GROUND')]

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

    # Sleep                                     5

    # Wait Until Page Contains Element          xpath=//div[@data-testid="pageNavigation-display"]

    # Sleep                                     2

    # Wait Until Page Contains Element          xpath=//div[@class="grid grid-cols-12"]/div
    # Page Should Contain Element               xpath=//div[@class="grid grid-cols-12"]/div

    ${element_8}    Get Element Count         xpath=//div[@class="grid grid-cols-12"]/div
    Log             Check Element: '8 Menu 2 Sub Menu 2 - Picture 2' ${element_8}                               console=yes

    # button - clear
    Wait Until Page Contains Element          xpath=//button[contains(text(), 'ล้างทั้งหมด')]
    Page Should Contain Element               xpath=//button[contains(text(), 'ล้างทั้งหมด')]
    Click Element                             xpath=//button[contains(text(), 'ล้างทั้งหมด')]

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
    # Click Element                             xpath=//button[contains(text(), 'FZ-Entrance-02')]

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

    Log             Check Element: '9 Menu 3 Sub Menu 1'                               console=yes

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

    Log             Check Element: '10 Menu 3 Sub Menu 2'                               console=yes

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

    Log             Check Element: '11 Menu 3 Sub Menu 3'                               console=yes

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

    Log             Check Element: '12 Menu 3 Sub Menu 4'                               console=yes
