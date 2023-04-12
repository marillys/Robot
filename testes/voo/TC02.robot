*** Settings ***
Resource  ../../steps/main_steps.robot
Test Setup  Fazer Login

*** Variables ***
${CidadeOrigem}  Salvador
${CidadeDestino}  São Paulo

*** Test Cases ***
TC02 - Reservando passagens internacionais na classe econômica
    Dado que eu realizo uma busca de um vôo ida e volta
    Quando informo que está saindo de ${CidadeOrigem}
    E indo para ${CidadeDestino} 
    #E saindo na data
    #E voltando na data
    #Quando eu clico em buscar
    #E seleciono o primeiro vôo
    #E preencho os dados do passageiro
    #E preencho os dados de pagamento
    #E clico em confirmar
    #Então a página de confirmação de viagem é exibida