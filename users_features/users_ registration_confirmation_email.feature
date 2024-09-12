#language: pt
#encoding: utf-8

Funcionalidade: E-mail de Confirmação de Cadastro

  Cenário: Envio do e-mail de confirmação
    Dado que o Usuário esteja na página de Cadastro de Usuário (/sign-up)
    Quando preencher todos os campos corretamente 
    E clicar no botão "Cadastrar"
    Então o sistema deve validar os dados
    E efetuar o envio do e-mail de confirmação
    E exibir uma mensagem informando que o e-mail foi enviado

  Cenário: Outros problemas
    Dado que o Usuário esteja na página de Cadastro de Usuário (/sign-up)
    Quando o sistema apresentar algum problema de conexão com o Backend ou outro problema não previsto
    E o Usuário clicar no botão de Cadastrar
    Então o sistema deve retornar um erro 500 - Internal Server Error, com uma mensagem apropriada ao usuário