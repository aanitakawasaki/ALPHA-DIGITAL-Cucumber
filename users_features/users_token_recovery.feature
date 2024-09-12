#language: pt
#encoding: utf-8

Funcionalidade: Token de Recuperação de Senha

  Cenário: Recuperação de senha
    Dado que o Usuário esteja na página de Recuperação de Senha (/forgot-password)
    Quando o usuário acessar o seu e-mail 
    E clicar no link de Recuperação de Senha
    Então o sistema irá validar o Token contido na URL (/validate-reset-token/{token})

  Cenário: Token válido
    Dado que o Usuário tenha acessado o link de Recuperação de Senha em seu e-mail
    Quando o Token for válido
    Então o sistema irá carregar uma página com o formulário para informar a Nova Senha (/password-reset)

  Cenário: Token expirado
    Dado que o Usuário tenha acessado o link de Recuperação de Senha em seu e-mail
    Quando o Token estiver expirado
    Então o sistema irá carregar uma página, requisitando uma nova solicitação de recuperação, pois o Token expirou (/password-reset)

  Cenário: Token Inválido
    Dado que o Usuário tenha acessado o link de Recuperação de Senha em seu e-mail
    Quando o Token for inválido
    Então o sistema irá carregar uma página, requisitando uma nova solicitação de recuperação, pois o Token é inválido(/password-reset)

  Cenário: Outros problemas
    Dado que o Usuário tenha acessado o link de Recuperação de Senha em seu e-mail
    Quando  o sistema apresentar algum problema de conexão com o Backend ou outro problema não previsto ao tentar executar a validação do Token URL
    Então o sistema deve retornar um erro 500 - Internal Server Error, com uma mensagem apropriada ao usuário