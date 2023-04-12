# ROBOT FRAMEWORK #

Primeiros passos utilizando o Robot Framework. 

## Cursos e vídeos utilizados:
- [QArentena 66: Robot Framework, por Mayara R. Fernandes](https://www.youtube.com/watch?v=r-Ju-O_miv0)
- [QArentena 68: Automação Mobile no Clone do Nubank com Robot Framework, por Fernando Papito](https://www.youtube.com/watch?v=mOc5CG7FjoU)
- [Aprenda Robot Framework](https://www.youtube.com/watch?v=wdtqpQrQ598&list=PL5ipcSFH2tk8RWxtvuaOK-qpdAvlWkSoo&index=2)

## Pré-requisitos
- Instalar o [Python](https://www.python.org/downloads/)
- Instalar o Robot framework via pip
    ```cmd
    pip install robotframework
    ```
- Instalar a biblioteca do selenium no robot
    ```bash
    pip install robotframework-seleniumlibrary
    ```
- Incluir o chromeDriver na pasta de Scripts do python

## Como executar
Os comandos abaixo são executados no terminal.
- Comando básico:
    ````bash
    robot nomeArquivo.robot
    ````
- Definindo uma pasta para salvar os arquivos de logs e os prints
    ````bash
    robot -d nomePastaEvidencias nomeArquivo.robot
    ````
- Executar somente um cenário de testes através do parametro -t
    ````bash
    robot -d nomePastaEvidencias -t "Nome do cenário"
    ````
- Executar somente testes de uma pasta específica
    ````bash
    robot -d nomePastaEvidencias nomePastaScripts
    ````
- Utilizando tags nos testes e executando através delas
    ````bash
    robot -d nomePastaEvidencias -i nomeTag testes
    ````

    Exemplo de cenário com tag
    ````Python
    Cenario 1: Executar vídeo no site do youtube
        [Tags]  regressivo
        Dado que eu acesso o site do youtube
        Quando digito o nome da música
        E clico no botão buscar
        E clico na primeira opção da lista
        Então o vídeo é executado

    ````

## Observações
:warning: A automação do site de passagem aérea não está funcionando 100% por causa do capcha da tela de criar usuários.