*** Settings ***
Library  SeleniumLibrary

*** Variables ***

${URL_User}              https://freezoneinventory-dev.azurewebsites.net
# ${URL}                   https://freezoneinventory-dev.azurewebsites.net/#/dev
${BROWSER}               Chrome
${Submit_Button}         เข้าสู่ระบบ
${robot_login}           3aa94123-01f6-47b8-b5ef-82400f62dccb

# Login B2C - 1
${user_1}                freezonedev-user01@gmail.com
${pass_1}                Zowu9444

# Login B2C - 2
${user_2}                testuserloginfail@gmail.com
${pass_2}                Vuqu0186

# Login B2C - 3
${user_3}                freezonedev-user01@gmail.com
${pass_3}                testpasswordfail

# Login B2C - 4
${user_4}                testuserloginfail@gmail.com
${pass_4}                testpasswordfail

# Login AD - 1
${user_ad_1}                ztantikornp@pttep.com
${pass_ad_1}                25&Px*tejZBkR9g

# Login AD - 2
${user_ad_2}                testuserloginfail@gmail.com
${pass_ad_2}                25&Px*tejZBkR9g

# Login AD - 3
${user_ad_3}                ztantikornp@pttep.com
${pass_ad_3}                testpasswordfail

*** Keywords ***

Console Check Element

    [Arguments]      ${element}

    Log               Check Element Count: ${element}         console=yes

Open Browser CASHCALL
    
    [Arguments]     ${URL}    ${BROWSER}

    Open Browser    ${URL}    ${BROWSER}    options=add_argument("--incognito")
    Maximize Browser Window

    ${windowtitles}        Get Window Titles

    Log               Check Function: '1. Open Browser CASHCALL' ${windowtitles}    console=yes

Choose Menu

    [Arguments]     ${menu}

    Page Should Contain Element               ${menu}
    Click Element                             ${menu}

Login In-User 

    Sleep                                     5

    Wait Until Page Contains Element          xpath=//button[@id="onetrust-accept-btn-handler"]
    Page Should Contain Element               xpath=//button[@id="onetrust-accept-btn-handler"]
    Click Element                             xpath=//button[@id="onetrust-accept-btn-handler"]

    Wait Until Page Contains Element          xpath=//select[@id="select_type_login"]
    Click Element                             xpath=//select[@id="select_type_login"]

    Wait Until Page Contains Element          xpath=//option[@id="ad"]
    Click Element                             xpath=//option[@id="ad"]

    Sleep                                     5

    Wait Until Page Contains Element          xpath=//input[@name="loginfmt"]        
    Input Text                                xpath=//input[@name="loginfmt"]            ${user_ad_1}

    Wait Until Page Contains Element          xpath=//input[@id="idSIButton9"]
    Click Element                             xpath=//input[@id="idSIButton9"]

    Sleep                                     2

    Wait Until Page Contains Element          xpath=//input[@name="passwd"]
    Input Text                                xpath=//input[@name="passwd"]             ${pass_ad_1}

    Wait Until Page Contains Element          xpath=//input[@id="idSIButton9"]
    Click Element                             xpath=//input[@id="idSIButton9"]

    Sleep                                     10

    Wait Until Page Contains Element          xpath=//input[@id="idSIButton9"]
    Click Element                             xpath=//input[@id="idSIButton9"]

Login Ex-User

    Wait Until Page Contains Element          xpath=//input[@id="email"]
    Page Should Contain Element               xpath=//input[@id="email"]
    Input Text                                xpath=//input[@id="email"]            ${user_1} 

    Wait Until Page Contains Element          xpath=//input[@id="password"]
    Page Should Contain Element               xpath=//input[@id="password"]
    Input Text                                xpath=//input[@id="password"]         ${pass_1} 

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

Check Tab Menu 
    
    Sleep             2

    ${windowhandles}=    Get Window Titles

    Log        'Window Titles'${windowhandles}        console=yes

    Wait Until Page Contains Element        xpath=//div[@data-testid="dropdowns-inverntoryControlReport-display"]
    Page Should Contain Element             xpath=//div[@data-testid="dropdowns-inverntoryControlReport-display"]

    Wait Until Page Contains Element        xpath=//div[@data-testid="dropdowns-photoImageStorageReport-display"]
    Page Should Contain Element             xpath=//div[@data-testid="dropdowns-photoImageStorageReport-display"]

    Wait Until Page Contains Element        xpath=//div[@data-testid="dropdowns-wahereHouse-display"]
    Page Should Contain Element             xpath=//div[@data-testid="dropdowns-wahereHouse-display"]
    
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
    Wait Until Page Contains Element          xpath=//input[@id="IMPORT_DOC"] 
    Input Text                                xpath=//input[@id="IMPORT_DOC"]        12345
    Page Should Contain Element               xpath=//input[@id="IMPORT_DOC"]

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

    # Sleep                                     1

    # Wait Until Page Contains Element          xpath=//span[contains(text(), '28')]
    # Click Element                             xpath=//span[contains(text(), '28')]
    # Page Should Contain Element               xpath=//span[contains(text(), '28')]

    Sleep                                     1

    # button - search
    Wait Until Page Contains Element          xpath=//button[contains(text(), 'ค้นหา')]
    Page Should Contain Element               xpath=//button[contains(text(), 'ค้นหา')]
    Click Element                             xpath=//button[contains(text(), 'ค้นหา')]         

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
    Input Text                                xpath=//input[@name="invoice"]            12345
    Page Should Contain Element               xpath=//input[@name="invoice"]

    # search - details 
    Wait Until Page Contains Element          xpath=//input[@name="material"] 
    Input Text                                xpath=//input[@name="material"]           12345
    Page Should Contain Element               xpath=//input[@name="material"] 

    # search - date from
    Wait Until Page Contains Element          xpath=//div[@data-testid="date-start-picker"]/div/button[2]
    Page Should Contain Element               xpath=//div[@data-testid="date-start-picker"]/div/button[2]
    Click Element                             xpath=//div[@data-testid="date-start-picker"]/div/button[2]

    # Sleep                                     1

    # #click month 
    # Wait Until Page Contains Element          xpath=//div[@class="react-calendar"]/div/button[3]
    # Page Should Contain Element               xpath=//div[@class="react-calendar"]/div/button[3]
    # Click Element                             xpath=//div[@class="react-calendar"]/div/button[3]

    # Sleep                                     1

    # #click year 
    # Wait Until Page Contains Element          xpath=//div[@class="react-calendar"]/div/button[3]
    # Page Should Contain Element               xpath=//div[@class="react-calendar"]/div/button[3]
    # Click Element                             xpath=//div[@class="react-calendar"]/div/button[3]

    # Sleep                                     1

    # #choose year 
    # Wait Until Page Contains Element          xpath=//div[@class="react-calendar__viewContainer"]/div/div/button[2]
    # Page Should Contain Element               xpath=//div[@class="react-calendar__viewContainer"]/div/div/button[2]
    # Click Element                             xpath=//div[@class="react-calendar__viewContainer"]/div/div/button[2]

    # Sleep                                     1

    # #choose month 
    # Wait Until Page Contains Element          xpath=//div[@class="react-calendar__viewContainer"]/div/div/button[6]
    # Page Should Contain Element               xpath=//div[@class="react-calendar__viewContainer"]/div/div/button[6]
    # Click Element                             xpath=//div[@class="react-calendar__viewContainer"]/div/div/button[6]

    # Sleep                                     1

    # #choose day 
    # Wait Until Page Contains Element          xpath=//div[@class="react-calendar__month-view"]/div/div/div[2]/button[3]
    # Page Should Contain Element               xpath=//div[@class="react-calendar__month-view"]/div/div/div[2]/button[3]
    # Click Element                             xpath=//div[@class="react-calendar__month-view"]/div/div/div[2]/button[3]

    Sleep                                     2

    # search - date to
    Wait Until Page Contains Element          xpath=//div[@data-testid="date-end-picker"]/div/button[2]
    Page Should Contain Element               xpath=//div[@data-testid="date-end-picker"]/div/button[2]
    Click Element                             xpath=//div[@data-testid="date-end-picker"]/div/button[2]
    
    Sleep                                     1

    # button - search
    # Wait Until Page Contains Element          xpath=//button[contains(text(), 'ค้นหา')]
    # Page Should Contain Element               xpath=//button[contains(text(), 'ค้นหา')]
    # Click Element                             xpath=//button[contains(text(), 'ค้นหา')]         

    # Sleep                                     1

    # # button - export
    # Wait Until Page Contains Element          xpath=//div[@class="col-span-12 md:col-span-4 text-right pr-2"]/button
    # Page Should Contain Element               xpath=//div[@class="col-span-12 md:col-span-4 text-right pr-2"]/button
    # Click Element                             xpath=//div[@class="col-span-12 md:col-span-4 text-right pr-2"]/button

    Sleep                                     1

    # button - clear
    Wait Until Page Contains Element          xpath=//button[contains(text(), 'ล้างทั้งหมด')]
    Page Should Contain Element               xpath=//button[contains(text(), 'ล้างทั้งหมด')]
    Click Element                             xpath=//button[contains(text(), 'ล้างทั้งหมด')]

    Sleep                                     1

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

    # search - date from 
    Wait Until Page Contains Element          xpath=//div[@data-testid="date-start-picker"]/div/button[2]
    Page Should Contain Element               xpath=//div[@data-testid="date-start-picker"]/div/button[2]
    Click Element                             xpath=//div[@data-testid="date-start-picker"]/div/button[2]

    Sleep                                     1

    # search - date to 
    Wait Until Page Contains Element          xpath=//div[@data-testid="date-end-picker"]/div/button[2]
    Page Should Contain Element               xpath=//div[@data-testid="date-end-picker"]/div/button[2]
    Click Element                             xpath=//div[@data-testid="date-end-picker"]/div/button[2]

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
    Input Text                                xpath=//input[@id="document"]           12345
    Page Should Contain Element               xpath=//input[@id="document"] 

    # search - material
    Wait Until Page Contains Element          xpath=//input[@id="material"] 
    Input Text                                xpath=//input[@id="material"]           12345
    Page Should Contain Element               xpath=//input[@id="material"] 

    # search - material
    Wait Until Page Contains Element          xpath=//input[@id="oldmat"] 
    Input Text                                xpath=//input[@id="oldmat"]           12345
    Page Should Contain Element               xpath=//input[@id="oldmat"] 

    # button - search
    Wait Until Page Contains Element          xpath=//button[contains(text(), 'ค้นหา')]
    Page Should Contain Element               xpath=//button[contains(text(), 'ค้นหา')]
    Click Element                             xpath=//button[contains(text(), 'ค้นหา')]         

    # # button - export
    # Wait Until Page Contains Element          xpath=//div[@class="col-span-12 md:col-span-4 text-right pr-2"]/button
    # Page Should Contain Element               xpath=//div[@class="col-span-12 md:col-span-4 text-right pr-2"]/button
    # Click Element                             xpath=//div[@class="col-span-12 md:col-span-4 text-right pr-2"]/button

    # button - clear
    Wait Until Page Contains Element          xpath=//button[contains(text(), 'ล้างทั้งหมด')]
    Page Should Contain Element               xpath=//button[contains(text(), 'ล้างทั้งหมด')]
    Click Element                             xpath=//button[contains(text(), 'ล้างทั้งหมด')]

    Sleep                                     1


Tab 1 Menu 4 

    Sleep                                     2

    Wait Until Page Contains Element          xpath=//span[contains(text(), 'รายงานควบคุมสินค้าคงคลัง')]
    Page Should Contain Element               xpath=//span[contains(text(), 'รายงานควบคุมสินค้าคงคลัง')]
    Click Element                             xpath=//span[contains(text(), 'รายงานควบคุมสินค้าคงคลัง')]
    
    Sleep                                     1

    Wait Until Page Contains Element          xpath=//div/li/a[contains(text(), 'รายงานประจำงวด')]
    Page Should Contain Element               xpath=//div/li/a[contains(text(), 'รายงานประจำงวด')]
    Click Element                             xpath=//div/li/a[contains(text(), 'รายงานประจำงวด')]

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
    Click Element                             xpath=//div[@data-testid="flowbite-accordion-content"][1]/div[2]/table/tbody/tr[1]/th[4]/button

    Sleep                                     1

    Wait Until Page Contains Element          xpath=//div[@data-testid="flowbite-accordion-content"][1]/div[2]/table/tbody/tr[1]/th[5]/button
    Page Should Contain Element               xpath=//div[@data-testid="flowbite-accordion-content"][1]/div[2]/table/tbody/tr[1]/th[5]/button
    Click Element                             xpath=//div[@data-testid="flowbite-accordion-content"][1]/div[2]/table/tbody/tr[1]/th[5]/button

    Sleep                                     1

    Wait Until Page Contains Element          xpath=//div[@data-testid="flowbite-accordion-content"][1]/div[2]/table/tbody/tr[2]/th[4]/button
    Page Should Contain Element               xpath=//div[@data-testid="flowbite-accordion-content"][1]/div[2]/table/tbody/tr[2]/th[4]/button
    Click Element                             xpath=//div[@data-testid="flowbite-accordion-content"][1]/div[2]/table/tbody/tr[2]/th[4]/button

    Sleep                                     1

    Wait Until Page Contains Element          xpath=//div[@data-testid="flowbite-accordion-content"][1]/div[2]/table/tbody/tr[2]/th[5]/button
    Page Should Contain Element               xpath=//div[@data-testid="flowbite-accordion-content"][1]/div[2]/table/tbody/tr[2]/th[5]/button
    Click Element                             xpath=//div[@data-testid="flowbite-accordion-content"][1]/div[2]/table/tbody/tr[2]/th[5]/button

Tab 1 Menu 4 - Tab 2

    Sleep                                     1

    Scroll Element Into View                  xpath=//h2/span[contains(text(), 'รายงานเคลื่อนไหวสินค้า')]

    Sleep                                     1
    
    Click Element                             xpath=//button/h2/span[contains(text(), 'รายงานเคลื่อนไหวสินค้า')]


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
    Click Element                             xpath=//div[@data-testid="flowbite-accordion-content"][2]/div[2]/table/tbody/tr[1]/th[4]/button

    Sleep                                     1

    Wait Until Page Contains Element          xpath=//div[@data-testid="flowbite-accordion-content"][2]/div[2]/table/tbody/tr[1]/th[5]/button
    Page Should Contain Element               xpath=//div[@data-testid="flowbite-accordion-content"][2]/div[2]/table/tbody/tr[1]/th[5]/button
    Click Element                             xpath=//div[@data-testid="flowbite-accordion-content"][2]/div[2]/table/tbody/tr[1]/th[5]/button

    Sleep                                     1

    Wait Until Page Contains Element          xpath=//div[@data-testid="flowbite-accordion-content"][2]/div[2]/table/tbody/tr[2]/th[4]/button
    Page Should Contain Element               xpath=//div[@data-testid="flowbite-accordion-content"][2]/div[2]/table/tbody/tr[2]/th[4]/button
    Click Element                             xpath=//div[@data-testid="flowbite-accordion-content"][2]/div[2]/table/tbody/tr[2]/th[4]/button

    Sleep                                     1

    Wait Until Page Contains Element          xpath=//div[@data-testid="flowbite-accordion-content"][2]/div[2]/table/tbody/tr[2]/th[5]/button
    Page Should Contain Element               xpath=//div[@data-testid="flowbite-accordion-content"][2]/div[2]/table/tbody/tr[2]/th[5]/button
    Click Element                             xpath=//div[@data-testid="flowbite-accordion-content"][2]/div[2]/table/tbody/tr[2]/th[5]/button

Tab 1 Menu 4 - Tab 3

    Sleep                                     1

    Scroll Element Into View                  xpath=//h2/span[contains(text(), 'รายงานขอขยายระยะเวลาจัดเก็บ')]
    
    Sleep                                     1

    Click Element                             xpath=//button/h2/span[contains(text(), 'รายงานขอขยายระยะเวลาจัดเก็บ')]

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
    Click Element                             xpath=//div[@data-testid="flowbite-accordion-content"][3]/div[2]/table/tbody/tr[1]/th[4]/button

    Sleep                                     1

    Wait Until Page Contains Element          xpath=//div[@data-testid="flowbite-accordion-content"][3]/div[2]/table/tbody/tr[1]/th[5]/button
    Page Should Contain Element               xpath=//div[@data-testid="flowbite-accordion-content"][3]/div[2]/table/tbody/tr[1]/th[5]/button
    Click Element                             xpath=//div[@data-testid="flowbite-accordion-content"][3]/div[2]/table/tbody/tr[1]/th[5]/button

    Sleep                                     1

    Wait Until Page Contains Element          xpath=//div[@data-testid="flowbite-accordion-content"][3]/div[2]/table/tbody/tr[2]/th[4]/button
    Page Should Contain Element               xpath=//div[@data-testid="flowbite-accordion-content"][3]/div[2]/table/tbody/tr[2]/th[4]/button
    Click Element                             xpath=//div[@data-testid="flowbite-accordion-content"][3]/div[2]/table/tbody/tr[2]/th[4]/button

    Sleep                                     1

    Wait Until Page Contains Element          xpath=//div[@data-testid="flowbite-accordion-content"][3]/div[2]/table/tbody/tr[2]/th[5]/button
    Page Should Contain Element               xpath=//div[@data-testid="flowbite-accordion-content"][3]/div[2]/table/tbody/tr[2]/th[5]/button
    Click Element                             xpath=//div[@data-testid="flowbite-accordion-content"][3]/div[2]/table/tbody/tr[2]/th[5]/button

*** Test Cases ***

Main Test
    
    Open Browser CASHCALL    ${URL_User}    ${BROWSER}

    # Login         ${URL}

    Login Ex-User    

    Check Tab Menu 

    # Tab 1 Menu 1

    # Tab 1 Menu 2

    # Tab 1 Menu 3

    # Tab 1 Menu 4 

    # Tab 1 Menu 4 - Tab 1

    # Tab 1 Menu 4 - Tab 2

    # Tab 1 Menu 4 - Tab 3

    [Teardown]            Close Browser
