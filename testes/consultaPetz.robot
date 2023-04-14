*** Settings ***
Documentation  Consultas no site da Petz

Library    SeleniumLibrary

Test Teardown  Fechar o Browser

*** Variables ***
${browser}   Chrome
${url}       https://www.petz.com.br/

*** Test Cases ***
Consulta produto apertando Enter
    [Tags]  rapido
    Dado que acesso o site como cliente
    Quando escrevo "ração" na barra de pesquisa
    E aperto a tecla Enter
    Entao exibe um grid e a frase do resultado esperado

Consulta produto Apertando na lupa
    [Tags]  rapido
    Dado que acesso o site como cliente
    Quando escrevo "ração" na barra de pesquisa
    E clico no botao da lupa
    Entao exibe um grid e a frase do resultado esperado

Compra de produto
    [Tags]  compra
    Dado que acesso o site como cliente
    Quando escrevo "comedouro furacão" na barra de pesquisa
    E aperto a tecla Enter
    Entao exibe um grid e a frase do resultado esperado
    Quando seleciono o produto "Comedouro Furacão Pet Coma Melhor Azul"
    Entao exibe a pagina do produto com o preco de "R$ 54,99"
    Quando mudamos a quantidade do produto para "2"
    E clico no botao Adicionar a sacola
    Entao exibe a pagina do carrinho com o total do produto

*** Keywords ***
Dado que acesso o site como cliente
    Open Browser  ${url}  ${browser}

Quando escrevo "${palavra_chave}" na barra de pesquisa
    Set Test Variable    ${palavra_chave}
    Wait Until Element Is Enabled    name=q  10000ms
    Input Text    name=q    ${palavra_chave}

E clico no botao da lupa
    Click Button    class=button-search

E aperto a tecla Enter
    Press Keys    name=q    ENTER

Entao exibe um grid e a frase do resultado esperado
    Wait Until Element Is Visible    css=h1.title  10000ms
    Element Should Contain    css=h1.title    Resultados para "${palavra_chave}"

Quando seleciono o produto "${produto}"
    Set Test Variable    ${produto}
    Wait Until Element Is Visible    xpath = //a[@id="produto-href"][@data-nomeproduto="${produto}"]  3000ms
    Click Element    xpath = //a[@id="produto-href"][@data-nomeproduto="${produto}"]

Entao exibe a pagina do produto com o preco de "${valorUnitario}"
    Wait Until Element Is Visible    xpath = //h1
    Element Should Contain    xpath = //h1    ${produto}
    Set Test Variable    ${valorUnitario}
    Element Should Contain    xpath = //div/strong    ${valorUnitario}

Quando mudamos a quantidade do produto para ${quantidade}
    Set Test Variable    ${quantidade}
    Clear Element Text    css=input#qty
    Input Text    css=input#qty    ${quantidade}

E clico no botao Adicionar a sacola
    Click Element    css=button#adicionarAoCarrinho.btn.btn-add-to-cart
Entao exibe a pagina do carrinho com o total do produto
    ${valorTotal} = ${valorUnitario} * ${quantidade}
    Set Test Variable    ${valorTotal}
    Element Should Contain    xpath = //div[@data-testid="ptz-bag-product-amount"]   ${valorTotal}

Fechar o Browser
    Close Browser