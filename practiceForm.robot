*** Settings ***
Library  SeleniumLibrary
*** Variables ***
${input_firstName}  id:firstName
${input_lastName}   id:lastName
${input_userEmail}  id:userEmail
${input_gender}  css:div.custom-control.custom-radio.custom-control-inline label
${input_userNumber}  id:userNumber
${input_dateOfBirthInput}  id:dateOfBirthInput
${div.calendario}  css:div.react-datepicker__month-container
${combo_mes_aniversario}  css:select.react-datepicker__month-select
${combo_ano_aniversario}  css:select.react-datepicker__year-select
${combo_data_aniversario}  css:div.react-datepicker__day.react-datepicker__day--013
${div_subjects}  css:div.subjects-auto-complete__value-container.subjects-auto-complete__value-container--is-multi.css-1hwfws3
${input_Sports}  css:input#hobbies-checkbox-1~label
${button_submit}  id:submit
${div_anuncio}  css:div.col-12.mt-4.col-md-3

*** Keywords ***
abrir navegador e acessar o site
    Open Browser  https://demoqa.com/automation-practice-form  chrome
    Maximize Browser Window

preencher campos
    Input Text    ${input_firstName}    Marilia
    Input Text    ${input_lastName}     Alves
    Input Text    ${input_userEmail}    test@email.com
    Click Element    ${input_gender}
    Input Text    ${input_userNumber}    999999999

    preencher data de nascimento

    Scroll Element Into View  ${button_submit}
    Element Should Be Visible  ${div_subjects}
    Click Element  ${div_subjects}
    # List Selection Should Be    ${div_subjects}    Math
    Click Element    ${input_Sports}
    Scroll Element Into View  ${button_submit}
    Element Should Be Visible  ${button_submit}
    Click Element    ${button_submit}
    Sleep    30

preencher data de nascimento
    Click Element    ${input_dateOfBirthInput}
    Element Should Be Visible  ${div.calendario}
    Click Element    ${combo_mes_aniversario}
    Select From List By Value    ${combo_mes_aniversario}  11
    Click Element    ${combo_ano_aniversario}
    Select From List By Value    ${combo_ano_aniversario}  2015
    Click Element    ${combo_data_aniversario}

*** Test Cases ***
Cenario 1: Preencher formulário demoqa
    abrir navegador e acessar o site
    preencher campos
    Close Browser