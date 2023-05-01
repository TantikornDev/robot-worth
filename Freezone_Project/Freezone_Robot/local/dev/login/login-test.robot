*** Settings ***
Library  SeleniumLibrary
# Library     Selenium2Library

*** Variables ***

${URL}                   https://freezoneinventory-dev.azurewebsites.net
${BROWSER}               Chrome

# ${URL}                   https://freezoneinventory-dev.azurewebsites.net/#/dev

# Login By Pass
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

    Open Browser    ${URL}    ${BROWSER}

    ${windowhandles}        Get Window Titles

    Log               Check Window Title: ${windowhandles}         console=yes

    # Title Should Be    หน้าหลัก | PTTEP

Login In-User

    Page Should Contain Element               dom:document.getElementById("rcc-confirm-button")
    ${element_1}         Get Element Count    dom:document.getElementById("rcc-confirm-button")
    Console Check Element                     ${element_1}
    Click Element                             dom:document.getElementById("rcc-confirm-button")

    Page Should Contain Element               dom:document.querySelector("#rcc-confirm-button")
    ${element_1}         Get Element Count    dom:document.querySelector("#rcc-confirm-button")
    Console Check Element                     ${element_1}
    Click Element                             dom:document.getElementById("rcc-confirm-button")

    Page Should Contain Element               xpath=//input[@id="username"]
    ${element_2}         Get Element Count    xpath=//input[@id="username"]
    Console Check Element                     ${element_2}

    Page Should Contain Element               dom:document.getElementById("password")
    ${element_3}         Get Element Count    dom:document.getElementById("password")
    Console Check Element                     ${element_3}
    Input Text                                xpath="//input[@id="password"]        xxxxx

    Page Should Contain Element               xpath="//select[@id="select_type_login"]"
    ${element_2}         Get Element Count    xpath="//select[@id="select_type_login"]"
    Console Check Element                     ${element_2}
    Select From List                          xpath="//select[@id="select_type_login"]"        เข้าสู่ระบบ ด้วย B2C       

    Page Should Contain Element            xpath="//input[@id="username"]
    Console Check Element                  xpath="//input[@id="username"]
    Click Element                          xpath="//input[@id="username"]                   ${u_admin}     

    Page Should Contain Element            xpath="//input[@id="password"]
    Console Check Element                  xpath="//input[@id="password"]
    Click Element                          xpath="//input[@id="password"]                   ${p_admin}     

    Page Should Contain Element            xpath=//button[@type="submit"]
    Console Check Element                  xpath=//button[@type="submit"]
    Click Element                          xpath=//button[@type="submit"]
    
    [Teardown]            Close Browser

Login Ex-User

    [Arguments]     ${user}    ${pass}

    Wait Until Page Contains Element          xpath=//input[@id="email"]
    Page Should Contain Element               xpath=//input[@id="email"]
    Input Text                                xpath=//input[@id="email"]            ${user} 

    Wait Until Page Contains Element          xpath=//input[@id="password"]
    Page Should Contain Element               xpath=//input[@id="password"]
    Input Text                                xpath=//input[@id="password"]         ${pass} 

    Wait Until Page Contains Element          xpath=//button[@type="submit"]
    Click Element                             xpath=//button[@type="submit"]


*** Test Cases ***

External Login 1

    Open Browser CASHCALL    ${URL}    ${BROWSER}

    Login Ex-User    ${user_1}    ${pass_1} 

    [Teardown]            Close Browser

External Login 2

    Open Browser CASHCALL    ${URL}    ${BROWSER}

    Login Ex-User    ${user_2}    ${pass_2} 

    [Teardown]            Close Browser

External Login 3

    Open Browser CASHCALL    ${URL}    ${BROWSER}

    Login Ex-User    ${user_3}    ${pass_3} 

    [Teardown]            Close Browser

External Login 4

    Open Browser CASHCALL    ${URL}    ${BROWSER}

    Login Ex-User    ${user_4}    ${pass_4} 

    [Teardown]            Close Browser
