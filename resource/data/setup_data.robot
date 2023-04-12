*** Settings ***
Resource  ../../orange/main.robot

*** Variables ***
&{setup}
...  URL=https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
...  Browser=chrome
...  User=Admin 
...  Password=admin123