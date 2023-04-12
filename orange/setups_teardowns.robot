*** Settings ***
Resource  main.robot

*** Keywords ***
Acessar site e logar
    Open Browser  ${setup.URL}  ${setup.Browser} 
    Maximize Browser Window
    Wait Until Element Is Visible  ${login.Input_Username}  10s
    Input Text  ${login.Input_Username}  ${setup.User}   
    Wait Until Element Is Visible  ${login.Input_Password}
    Input Text  ${login.Input_Password}  ${setup.Password}
    Wait Until Element Is Visible  ${login.Btn_Login}
    Click Element  ${login.Btn_Login} 
    Wait Until Element Is Visible  ${home.H1_Title}

Fechar navegador
    Close Browser