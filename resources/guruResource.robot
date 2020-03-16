*** Keywords ***
Start test
    open browser  http://www.demo.guru99.com/V4/    ff
    maximize browser window

End test
    close all browsers

Wrong login
    alert should be present


Login
    [Arguments]  ${username}    ${password}
    input text  //input[@name='uid']    ${username}
    input text  //input[@name = 'password']     ${password}
    click button  //input[@name = 'btnLogin']

Reload webpage
    go to  http://www.demo.guru99.com/V4/
    wait until page contains element  //input[@name='uid']  5
    wait until page contains element  //input[@name = 'password']   5
    wait until page contains element  //input[@name = 'btnLogin']   5

Confirm login
    location should be      http://www.demo.guru99.com/V4/manager/Managerhomepage.php

Close iframe
    run keyword and ignore error    wait until keyword succeeds     10  2  click element  //div[@id='primis_container_div']/iframe[@id='flow_close_btn_iframe']

Select new account
    click element  //a[contains(text(),'New Account')]



