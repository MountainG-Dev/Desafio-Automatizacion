*** Settings ***
Library     SeleniumLibrary
Library     Screenshot
Variables   ../WebElements.py

*** Variables ***
@{RadioButton}                   ${SignInPageRadio1}  ${SignInPageRadio2}

*** Keywords ***
Validar Vista Autenticación
    Sleep                        2
    Page Should Contain          ${SignInPageElementVal1}

Validar Cuenta Creada
    [Arguments]                  ${email}   ${pass}
    Wait Until Page Contains Element          xpath://div[@id='create_account_error']/ol/li
    Sleep                        3
    ${Valcuenta}=                Get Text    xpath://div[@id='create_account_error']/ol/li
    Sleep                        2
    Run Keyword If               '${Valcuenta}' == 'An account using this email address has already been registered. Please enter a valid password or request a new one.'     Ingresar Credenciales y Acceder Con Usuario Creado      ${email}    ${pass}
    ...                          ELSE           Acceder a Crear Cuenta  ${email}

Acceder a Crear Cuenta
    [Arguments]                  ${email}
    Input Text                   ${SignInPageInputEmail}                 ${email}
    Click Element                ${SignInPageButtonCreateAccount}
    Sleep                        3
    
Validar e Ingresar Información Formulario Crear Cuenta
    [Arguments]                  ${Fname}  ${Lname}  ${pass}  ${day}  ${month}  ${year}  ${company}  ${address1}  ${address2}  ${city}  ${state}  ${postcode}  ${country}  ${other}  ${phone}  ${phoneM}  ${alias}
    Sleep                        3
    Page Should Contain          ${SignInPageElementVal2}
# Validar Información Personal
    ${SelradioButton}=           Evaluate                                random.choice(${radiobutton})  random
    Click Element                ${SelradioButton}
    Input Text                   ${SignInPageInputFirstName}             ${Fname}
    Input Text                   ${SignInPageInputLastName}              ${Lname}
    Input Password               ${SignInPageInputPassword}              ${pass}
    Select From List By Value    ${SignInPageDropDownDia}                ${day}
    Select From List By Value    ${SignInPageDropDownMes}                ${month}
    Select From List By Value    ${SignInPageDropDownAno}                ${year}
    Click Element                ${SignInPageCheckNewLetter}
    Click Element                ${SignInPageCheckOption}
    Capture Page Screenshot      ${SignInPageScreenshotDatos1}
# Validar Información de Dirección
    Input Text                   ${SignInPageInputCompany}               ${company}
    Input Text                   ${SignInPageInputAddress1}              ${address1}
    Input Text                   ${SignInPageInputAddress2}              ${address2}
    Input Text                   ${SignInPageInputCity}                  ${city}
    Select From List By Value    ${SignInPageDropDownState}              ${state}
    Input Text                   ${SignInPageInputPostCode}              ${postcode}
    Select From List By Value    ${SignInPageDropDownCountry}            ${country}
    Input Text                   ${SignInPageInputOther}                 ${other}
    Input Text                   ${SignInPageInputPhone}                 ${phone}
    Input Text                   ${SignInPageInputPhoneMobile}           ${phoneM}
    Input Text                   ${SignInPageInputAlias}                 ${alias}
    Capture Page Screenshot      ${SignInPageScreenshotDatos2}

Validar Boton Agregar Cuenta
    Click Element                ${SignInPageButtonRegister}

Ingresar Credenciales y Acceder Con Usuario Creado
    [Arguments]                  ${email}    ${pass}
    Input Text                   ${HomePageInputEmail}                   ${email}
    Input Text                   ${HomePageInputPass}                    ${pass}
    Click Element                ${HomePageButtonSignIn}




    





