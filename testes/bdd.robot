*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${NomeDaMusica}  Jack e os Piratas da terra do nunca

${URL}  https://www.youtube.com/
${Browser}  chrome
${input_Pesquisa}  //input[@id='search']
${Button_Pesquisa}  //button[@id='search-icon-legacy']
${Primeiro}  //ytd-video-renderer[@class='style-scope ytd-item-section-renderer'][1]
${Compartilhar}  //span[contains(text(),"Compartilhar")][1]

*** Keywords ***
Dado que eu acesso o site do youtube
    Open Browser  ${URL}  ${Browser}
Quando digito o nome da música
    Input Text  ${input_Pesquisa}  ${NomeDaMusica}
E clico no botão buscar
    Click Element    ${Button_Pesquisa}

E clico na primeira opção da lista
    Wait Until Element Is Visible  ${Primeiro}  10
    Click Element    ${Primeiro}

Então o vídeo é executado
    Wait Until Element Is Visible  ${Compartilhar}  10
    Element Should Be Visible    ${Compartilhar}
    Sleep  2s
    Close Browser

*** Test Cases ***
Cenario 1: Executar vídeo no site do youtube
    [Tags]  regressivo
    Dado que eu acesso o site do youtube
    Quando digito o nome da música
    E clico no botão buscar
    E clico na primeira opção da lista
    Então o vídeo é executado