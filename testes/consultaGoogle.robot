*** Settings ***
Library    SeleniumLibrary

Documentation  Automação de uma consulta no Google
*** Test Cases ***
Consulta Google
    [Tags]  rapido
    Acessar o Chrome na pagina <https://www.google.com.br>
    Digita "Ovos de Páscoa" na pesquisa
    Validar se aparece no titulo da guia o resultado esperado
    Fechar o Browser

*** Keywords ***
Acessar o ${browser} na pagina <${url}>
    Open Browser  ${url}  ${browser}

Digita "${palavra_chave}" na pesquisa
    Set Test Variable    ${palavra_chave}
    Input Text    name=q    ${palavra_chave}
    Press Keys    name=q    ENTER
Validar se aparece no titulo da guia o resultado esperado
    ${titulo} =  Get Title

    Should Contain    ${titulo}    ${palavra_chave}
Fechar o Browser
    Close Browser