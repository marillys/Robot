*** Settings ***
Resource  ../../../resource/Settings_phpTravels.resource
Resource  ../../../elements/phpTravels/main_elements.resource

*** Keywords ***
Dado que eu acesse o php travels
    Open Browser  ${URL}  ${Browser}
    Maximize Browser Window
E realize o cadastro
    Wait Until Element Is Visible      ${Home.button_Account}            10
    Click Button    ${Home.button_Account}
    Wait Until Element Is Visible      ${Home.A_Signup}            10
    Click Element                      ${Home.A_Signup}
    Wait Until Element Is Visible      ${Login.Input_PrimeiroNome}  10
    Input Text                         ${Login.Input_PrimeiroNome}  ${PrimeiroNome}
    Wait Until Element Is Visible      ${Login.Input_UltimoNome}    10
    Input Text                         ${Login.Input_UltimoNome}    ${UltimoNome}     
    Wait Until Element Is Visible      ${Login.Input_Telefone}      10
    Input Text                         ${Login.Input_Telefone}      ${Telefone}  
    Wait Until Element Is Visible      ${Login.Input_Email}         10
    Input Text                         ${Login.Input_Email}         ${Email}  
    Wait Until Element Is Visible      ${Login.Input_Senha}         10 
    Input Text                         ${Login.Input_Senha}         ${Senha}
    Wait Until Element Is Visible      ${Login.Button_Cookie}       10
    Click Element                      ${Login.Button_Cookie}     
    Click Element    ${Login.captcha}    
    Wait Until Element Is Visible      ${Login.Button_Signup}       10 
    Sleep                              2s
    Run Keyword And Ignore Error       Click Element                      ${Login.Button_Signup}    
    Click Element                      ${Login.Button_Signup}
E faça o Login
    Wait Until Element Is Visible      ${Home.button_Account}            10
    Click Button    ${Home.button_Account}
    Wait Until Element Is Visible    ${Home.button_Login}  10
    Click Element  ${Home.button_Login}
    #Wait Until Element Is Visible  ${Login.A_OpcaoLogin}      10
    #Click Element                  ${Login.A_OpcaoLogin} 
    Wait Until Element Is Visible  ${Login.Input_EmailLogin}  10
    Input Text                     ${Login.Input_EmailLogin}  ${Email}
    Wait Until Element Is Visible  ${Login.Input_SenhaLogin}  10
    Input Text                     ${Login.Input_SenhaLogin}  ${Senha}
    Run Keyword And Ignore Error   Wait Until Element Is Visible  ${Login.Button_Cookie}     5
    Run Keyword And Ignore Error   Click Element                  ${Login.Button_Cookie}
    Wait Until Element Is Visible  ${Login.Button_Logar}      10
    Click Element                  ${Login.Button_Logar} 

E fecho o navegador
    Close Browser

Fazer Login
    Dado que eu acesse o php travels
    #E realize o cadastro 
    E faça o Login

Fechar navegador
    E fecho o navegador