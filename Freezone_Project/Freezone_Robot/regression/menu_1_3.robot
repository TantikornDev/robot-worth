*** Settings ***
Library  SeleniumLibrary
Library  RequestsLibrary
Library  OperatingSystem

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

    ${windowtitles}        Get Window Titles

    Log               Check Function: '1. Open Browser CASHCALL' ${windowtitles}    console=yes

Choose Menu

    [Arguments]     ${menu}

    Page Should Contain Element               ${menu}
    Click Element                             ${menu}

Get Run Time

    [Arguments]     ${start_time}    ${end_time}

    ${duration}    Evaluate    ${end_time} - ${start_time}

    Log        Duration: ${duration}        console=yes

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

Check Exported File

    ${file_path}=  Convert To String  /Users/kingdouchebag/Downloads/Inverntory Extended Report 1_2565}.xlsx

    File Should Exist  ${file_path}

    File Should Not Be Empty  ${file_path}

Check Tab Menu 
    
    Sleep             2

    Wait Until Page Contains Element        xpath=//div[@data-testid="dropdowns-inverntoryControlReport-display"]
    Page Should Contain Element             xpath=//div[@data-testid="dropdowns-inverntoryControlReport-display"]

    Wait Until Page Contains Element        xpath=//div[@data-testid="dropdowns-photoImageStorageReport-display"]
    Page Should Contain Element             xpath=//div[@data-testid="dropdowns-photoImageStorageReport-display"]

    Wait Until Page Contains Element        xpath=//div[@data-testid="dropdowns-wahereHouse-display"]
    Page Should Contain Element             xpath=//div[@data-testid="dropdowns-wahereHouse-display"]

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

    Scroll Element Into View                  xpath=//input[@id="oldmat"] 

    Sleep                                     1

    # search - select year
    Wait Until Page Contains Element          xpath=//select[@id="selectYears"]
    Click Element                             xpath=//select[@id="selectYears"]
    Page Should Contain Element               xpath=//select[@id="selectYears"]

    # Sleep                                     1

    # # search - date from 
    # Wait Until Page Contains Element          xpath=//div[@data-testid="date-start-picker"]/div/button[2]
    # Page Should Contain Element               xpath=//div[@data-testid="date-start-picker"]/div/button[2]
    # Click Element                             xpath=//div[@data-testid="date-start-picker"]/div/button[2]

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

    Sleep                                     1

    # search - plant 
    Wait Until Page Contains Element          xpath=//select[@id="plant"]
    Page Should Contain Element               xpath=//select[@id="plant"]        
    Click Element                             xpath=//select[@id="plant"]

    Wait Until Page Contains Element          xpath=//option[@value='9902']
    Page Should Contain Element               xpath=//option[@value='9902']    
    Click Element                             xpath=//option[@value='9902']

    # # search - document
    # Wait Until Page Contains Element          xpath=//input[@id="document"] 
    # Input Text                                xpath=//input[@id="document"]           12345
    # Page Should Contain Element               xpath=//input[@id="document"] 

    # # search - material
    # Wait Until Page Contains Element          xpath=//input[@id="material"] 
    # Input Text                                xpath=//input[@id="material"]           12345
    # Page Should Contain Element               xpath=//input[@id="material"] 

    # # search - material
    # Wait Until Page Contains Element          xpath=//input[@id="oldmat"] 
    # Input Text                                xpath=//input[@id="oldmat"]           12345
    # Page Should Contain Element               xpath=//input[@id="oldmat"] 

    # button - search
    Wait Until Page Contains Element          xpath=//button[contains(text(), 'ค้นหา')]
    Page Should Contain Element               xpath=//button[contains(text(), 'ค้นหา')]
    Click Element                             xpath=//button[contains(text(), 'ค้นหา')]         

    Sleep                                     2

    ${start_time}     Get Time                     result_format=seconds

    Wait Until Page Contains Element          xpath=//tr[@class="bg-white whitespace-nowrap"]
    Page Should Contain Element               xpath=//tr[@class="bg-white whitespace-nowrap"]

    ${element_1}    Get Element Count         xpath=//tr[@class="bg-white whitespace-nowrap"]
    Log             Check Element: 'record' ${element_1}                               console=yes

    Scroll Element Into View                  xpath=//div[@class="col-span-12 md:col-span-4 text-right pr-2"]/button

    Sleep                                     1

    Capture Page Screenshot                   1.png

    Sleep                                     1

    Scroll Element Into View                  xpath=//div[@data-testid="pageNavigation-display"]
        
    ${end_time}       Get Time                     result_format=seconds
    Get Run Time        ${start_time}        ${end_time}

    Sleep                                     1

    Capture Page Screenshot                   2.png

    Sleep                                     1

    # button - export
    Wait Until Page Contains Element          xpath=//div[@class="col-span-12 md:col-span-4 text-right pr-2"]/button
    Page Should Contain Element               xpath=//div[@class="col-span-12 md:col-span-4 text-right pr-2"]/button
    Click Element                             xpath=//div[@class="col-span-12 md:col-span-4 text-right pr-2"]/button

    Sleep                                     10

    Check Exported File

    Sleep                                     1

    # button - clear
    Wait Until Page Contains Element          xpath=//button[contains(text(), 'ล้างทั้งหมด')]
    Page Should Contain Element               xpath=//button[contains(text(), 'ล้างทั้งหมด')]
    Click Element                             xpath=//button[contains(text(), 'ล้างทั้งหมด')]

    Sleep                                     1
   
*** Test Cases ***

Main Test
    
    Open Browser CASHCALL    ${URL}    ${BROWSER}

    Login         ${URL}

    Check Tab Menu 

    Tab 1 Menu 3

    [Teardown]            Close Browser
