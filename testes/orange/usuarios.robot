*** Settings ***
Resource  ../../orange/main.robot
Test Setup  Acessar site e logar
Test Teardown  Fechar navegador

*** Test Cases ***
TC01 - Cadastrar 3 usuários
    [Tags]  TC01  Usuarios
    Dado que eu acesse a opção PIM no menu
    E clico em "Add Employee"
    Então adiciono 1 novos usuários