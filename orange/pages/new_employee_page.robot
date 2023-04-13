*** Settings ***
Resource  ../main.robot

*** Variables ***
&{new_employee}
...  Input_FirstName=//input[@name="firstName"]
...  Input_MiddleName=//input[@name="middleName"]
...  Input_LastName=//input[@name="lastName"]
...  Photo_Input=css:input.oxd-file-input
...  Btn_Save=css:button.oxd-button.oxd-button--medium.oxd-button--secondary.orangehrm-left-space
...  Title_Registred_Employee=css:h6.oxd-text.oxd-text--h6.--strong
...  a_Immigration=//a[contains(text(),"Immigration")]

*** Keywords ***
Então adiciono ${Quantidade} novos usuários
    FOR  ${i}  IN RANGE  ${Quantidade}
        Wait Until Element Is Visible  ${new_employee.Input_FirstName}
        Input Text  ${new_employee.Input_FirstName}  ${employee.First_Name} ${i}
        Input Text  ${new_employee.Input_MiddleName}  ${employee.Middle_Name} 
        Input Text  ${new_employee.Input_LastName}  ${employee.Last_Name}
        Choose File  ${new_employee.Photo_Input}  ${employee.Profile_Photo}  
        Wait Until Element Is Visible  ${new_employee.Btn_Save}  10
        Click Element  ${new_employee.Btn_Save} 
        Wait Until Element Is Visible  ${new_employee.a_Immigration}  30
        Wait Until Element Is Visible  ${new_employee.Title_Registred_Employee}  30
        Page Should Contain  ${employee.First_Name} ${i} ${employee.Middle_Name} ${employee.Last_Name}
        E clico em "Add Employee"
    END 
