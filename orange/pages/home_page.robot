*** Settings ***
Resource  ../main.robot

*** Variables ***
&{home}
...  H1_Title=//span[@class="oxd-topbar-header-breadcrumb"]/h6
...  Opcao_PIM_Menu=//a[@href="/web/index.php/pim/viewPimModule"]
...  Btn_Add_New_Employee=//a[contains(text(),"Add Employee")]

*** Keywords ***
Dado que eu acesse a opção PIM no menu
    Wait Until Element Is Visible  ${home.Opcao_PIM_Menu}    
    Click Element  ${home.Opcao_PIM_Menu}

E clico em "Add Employee"
    Wait Until Element Is Visible  ${home.Btn_Add_New_Employee}
    Click Element  ${home.Btn_Add_New_Employee}