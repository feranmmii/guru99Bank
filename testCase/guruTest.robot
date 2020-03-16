*** Settings ***
Documentation    Suite description
Library  SeleniumLibrary
Resource    ../resources/guruResource.robot


Suite Setup  Start test
Suite Teardown  End test

*** Variables ***
${username}     mngr250274
${password}     setetUs

*** Test Cases ***
TC01_empty login fields
    [Tags]  Invalid_login
    Login   ${EMPTY}    ${EMPTY}
    Wrong login

TC02_login with empty username and correct password
    [Tags]  Invalid_login
    Reload webpage
    Login   ${EMPTY}    ${password}
    Wrong login

TC03_login with correct username and empty password
    [Tags]  Invalid_login
    Reload webpage
    Login   ${username}     ${EMPTY}
   wait until keyword succeeds   15s     5s      click button  //input[@name = 'btnLogin']
    Wrong login

TC04_login with wrong username and correct password
    [Tags]  Invalid_login
    Reload webpage
    Login   wrongname   ${password}
    Wrong login

TC05_login with correct username and wrong password
    [Tags]  Invalid_login
    Reload webpage
    Login   ${username}     wrongpass
    Wrong login

TC06_login with correct username and correct password
    [Tags]  Invalid_login
    Reload webpage
    Login   ${username}     ${password}
    Confirm login

TC07_account_creation_without_customer_id
    [Tags]  Customer_account
    Close iframe
    Select new account
    Create account  ${EMPTY}    ${EMPTY}
    Wrong login

TC08_create_account_with_customer_id_that_has_special_character
    [Tags]  Customer_account_creation
    Create account  37848920\}      800
    Wrong login

TC09_create_account_with_customer_id_created_with_characters
    [Tags]  Customer_account_creation
    Create account  thenei37    560
    Wrong login

TC10_create_account_with_customer_id_whose_first_character_is_space
    [Tags]  Customer_account_creation
    Create account  ${SPACE}738390303   560
    Wrong login






