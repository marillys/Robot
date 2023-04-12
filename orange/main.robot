*** Settings ***
Library  SeleniumLibrary


### Shared ###
Resource  setups_teardowns.robot

### Data ###
Resource  ../resource/data/setup_data.robot
Resource  ../resource/data/employee_data.robot

### Pages ###
Resource  pages/login_page.robot
Resource  pages/home_page.robot
Resource  pages/new_employee_page.robot