*** Settings ***
Documentation    Cenarios de testes do cadastro de usuarios de

Library    Browser
Library    FakerLibrary

*** Test Cases ***
Deve poder cadastrar um novo usuário
    #Massa de teste dinamica
    ${name}        FakerLibrary.Name
    ${email}       FakerLibrary.Free Email
    ${password}    Set Variable    pwd123

    #Seção do navegador
    New Browser    browser=chromium    headless=False
    New Page       http://localhost:3000/signup

    #Checkpoint para garantir que o fluxo está correto
    Wait For Elements State    css=h1    visible    5
    Get Text                   css=h1    equal    Faça seu cadastro

    # Preenchimento do Formulario
    Fill Text    id=name        ${name}   
    Fill Text    id=email       ${email}
    Fill Text    id=password    ${password}
    
    #Clique no botão
    Click        id=buttonSignup

    #Validação de msg de boas vindas. Garantia de que o user foi cadastrado
    Wait For Elements State    css=.notice p    visible    5
    Get Text                   css=.notice p    equal      Boas vindas ao Mark85, o seu gerenciador de tarefas.

 
    