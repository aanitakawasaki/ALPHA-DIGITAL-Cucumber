#language: pt
#encoding: utf-8

Funcionalidade: Login de Usuário

  Como um usuário não autenticado
  Eu quero acessar o sistema
  Para que eu possa utilizar as funcionalidades disponíveis após o login

  Cenário: Login com credenciais corretas
    Dado que o Usuário esteja na página de Login (/sign-in)
    Quando preencher o campo de E-mail com um E-mail correto e que já está cadastrado
    E preencher o campo de Senha com a senha correta
    E pressionar o botão Login
    Então o sistema deve redirecionar o Usuário para a Área Logada (/dashboard)

  Cenário: Campos obrigatórios em branco
    Dado que o Usuário esteja na página de Login (/sign-in)
    Quando não preencher (deixar em branco) um ou mais campos
    E pressionar o botão Login
    Então o sistema deve exibir uma mensagem exigindo o preenchimento dos campos vazios
    E não efetuar o login

  Cenário: E-mail incorreto
    Dado que o Usuário esteja na página de Login (/sign-in)
    Quando preencher o campo de E-mail com um E-mail Incorreto/Não cadastrado
    E preencher o campo de Senha corretamente
    E pressionar o botão Login
    Então o sistema deve exibir uma mensagem informando que o E-mail inserido não foi encontrado
    E não efetuar o login

  Cenário: Senha incorreta
    Dado que o Usuário esteja na página de Login (/sign-in)
    Quando preencher o campo de E-mail com um E-mail correto e cadastrado
    E preencher o campo de Senha com a Senha incorreta
    E pressionar o botão Login
    Então o sistema deve exibir uma mensagem de Senha incorreta
    E não efetuar o login

  Cenário: Link para página de Cadastro
    Dado que o Usuário esteja na página de Login (/sign-in)
    Quando clicar no botão/link de "Não possuo uma conta"
    Então o sistema deve redirecionar o Usuário para a página de Cadastro de Usuário (/sign-up)

  Cenário: Problemas de conexão ou erro interno
    Dado que o Usuário esteja na página de Login (/sign-in)
    Quando o sistema apresentar algum problema de conexão com o Backend ou outro problema não previsto
    E o Usuário clicar no botão de Login
    Então o sistema deve retornar um erro 500 - Internal Server Error, com uma mensagem apropriada ao usuário