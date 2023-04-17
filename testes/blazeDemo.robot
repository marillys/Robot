*** Settings ***
Documentation   Teste do site Blazedemo 

Library   SeleniumLibrary

### Inicio e Fim
Test Setup        Open Browser    ${url}    ${browser}
Test Teardown     close browser
*** Variables ***
${browser}   Chrome
${url}       https://blazedemo.com/

*** Test Cases ***
Compra de Passagem
    [Tags]  Regressao
    Dado que acesso o site blazedemo
    Quando seleciono a origem com "São Paolo"
    E o destino "London"
    E clico no botao Find Flights
    Entao exibe uma lista de voos para o trecho desejado
    Quando seleciono o primeiro voo disponivel
    E preencho o nome como "Juca"
    E seleciono a bandeira como "American Express"
    E marco a opcao Remember
    E clico em Purchase Flights
    Entao exibe a mensagem de obrigado
    E o valor como "555 USD"

*** Keywords ***
Dado que acesso o site blazedemo
    Wait Until Element Is Enabled    xpath=//h1
    Element Should Contain    xpath=//h1    Welcome to the Simple Travel Agency!
Quando seleciono a origem com "${origem}"
    Set Test Variable    ${origem}
    Select From List By Label    name = fromPort    ${origem}
E o destino "${destino}"
    Set Test Variable    ${destino}
    Select From List By Label    name = toPort    ${destino}
E clico no botao Find Flights
    Click Element    xpath=//input[@value="Find Flights"]
Entao exibe uma lista de voos para o trecho desejado
    Wait Until Element Is Enabled      xpath=//h3    30000ms
    Element Should Contain    xpath=//h3    Flights from ${origem} to ${destino}: 
Quando seleciono o primeiro voo disponivel
    Click Element    xpath=//input[@value="Choose This Flight"][1]
    Wait Until Element Is Enabled    xpath=//h2   30000ms
    Element Should Contain    xpath=//h2    Your flight from TLV to SFO has been reserved.
E preencho o nome como "${nome}"
    Wait Until Element Is Enabled    xpath=//input[@name="inputName"]    30000ms
    Input Text    xpath=//input[@name="inputName"]    ${nome}
E seleciono a bandeira como "${bandeira}"
    Select From List By Label   name=cardType   ${bandeira}
E marco a opcao Remember
    Select Checkbox    id=rememberMe
E clico em Purchase Flights
    Click Element    css=input.btn.btn-primary
Entao exibe a mensagem de obrigado
    Wait Until Element Is Visible    xpath=//h1
    Page Should Contain    Thank you for your purchase today!
E o valor como "${valor}"
    Element Should Contain    xpath=//table    ${valor}