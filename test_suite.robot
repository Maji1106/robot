*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${BROWSER}              Chrome
${VALID_NAME_TH_1}      นาย
${VALID_FIRSTNAME_TH}   ณัชนนท์
${VALID_LASTNAME_TH}    เพิ่มนาม
${VALID_NAME_EN_1}      Mr.
${VALID_FIRSTNAME_EN}   Natchanon
${VALID_LASTNAME_EN}    phemnam
${DAY}                  11
${MONTH}                มิถุนายน
${YEAR}                 2004
${VALID_ID_CARD}        1234567890123
${VALID_PASSWORD}       123456789PP
${VALID_PHONE_NUMBER}   0845767686
${VALID_EMAIL_WEBMAIL}  654259013@webmail.npru.ac.th

*** Test Cases ***
Successfully signed up
    Open Signup Form
    Wait Until Page
    Input TH Information
    Input EN Information
    Input Birthday
    Input ID Card
    Input Password
    Input Phone Number
    Input Email
    Input Checkbox
    Click Button
    Verify Signup Results
    Close Browser

Check Invalid Name TH
    Open Signup Form
    Wait Until Page
    Input Invalid TH Name
    Click Button
    Verify Invalid Name TH Only
    Close Browser

Check Invalid Name EN
    Open Signup Form
    Wait Until Page
    Input Invalid EN Name
    Click Button
    Verify Invalid Name EN Only
    Close Browser

Check Invalid ID Card
    Open Signup Form
    Wait Until Page
    Input Invalid ID Card
    Click Button
    Verify Invalid ID Card Only
    Close Browser

*** Keywords ***
Open Signup Form
    Open Browser   https://formik-react-rv2o.vercel.app/    ${BROWSER}

Wait Until Page
    Wait Until Page Contains Element    id=root

Input TH Information
    Select From List by Value    id=nameTitleTha    ${VALID_NAME_TH_1}
    Input Text    id=firstnameTha    ${VALID_FIRSTNAME_TH}
    Input Text    id=lastnameTha     ${VALID_LASTNAME_TH}

Input EN Information
    Select From List by Value    id=nameTitleEng    ${VALID_NAME_EN_1}
    Input Text    id=firstnameEng    ${VALID_FIRSTNAME_EN}
    Input Text    id=lastnameEng     ${VALID_LASTNAME_EN}

Input Birthday
    Select From List by Value    id=birthDate    ${DAY}
    Select From List by Label    id=birthMonth    ${MONTH}
    Select From List by Label    id=birthYear    ${YEAR}

Input ID Card
    Input Text    id=idCard    ${VALID_ID_CARD}

Input Password
    Input Text    id=password    ${VALID_PASSWORD}

Input Phone Number
    Input Text    id=mobile    ${VALID_PHONE_NUMBER}

Input Email
    Input Text    id=email    ${VALID_EMAIL_WEBMAIL}

Input Checkbox
    Execute JavaScript    document.getElementById('accept').click()

Click Button
    Wait Until Element Is Visible    id=submitbtn
    Click Element    id=submitbtn
    ...    # เพิ่มการรอให้ปุ่มตรงก่อนที่จะคลิก

Verify Signup Results
    Wait Until Page Contains    Submitting...
    Page Should Contain    Submitting...

Input Invalid TH Name
    Select From List by Value    id=nameTitleTha    ${VALID_NAME_TH_1}
    Input Text    id=firstnameTha    Natchanon
    Input Text    id=lastnameTha     phemnam

Input Invalid EN Name
    Select From List by Value    id=nameTitleEng    ${VALID_NAME_EN_1}
    Input Text    id=firstnameEng    ณัชนนท์
    Input Text    id=lastnameEng     เพิ่มนาม

Input Invalid ID Card
    Input Text    id=idCard    1234567890123

Verify Invalid Name TH Only
    Page Should Contain    Must be in Thai only

Verify Invalid Name EN Only
    Page Should Contain    Must be in English only

Verify Invalid ID Card Only
    Page Should Contain    Number only