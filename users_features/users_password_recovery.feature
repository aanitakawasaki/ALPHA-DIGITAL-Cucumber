#language: pt
#encoding: utf-8

Funcionalidade: Recuperação de Senha

  Como um usuário que esqueceu sua senha
  Eu quero recuperar o acesso à minha conta
  Para que eu possa redefinir minha senha e voltar a usar o sistema

  Cenário: Acesso à página de recuperação de senha
    Dado que o Usuário esteja na página de Login (/sign-in)
    Quando clicar no botão/link "Esqueci minha senha"
    Então o sistema deve redirecionar o Usuário para a página de Recuperação de Senha (/forgot-password)

  Cenário: Solicitação - E-mail Cadastrado
    Dado que o Usuário esteja na página de Recuperação de Senha (/forgot-password)
    Quando preencher o campo de E-mail com um E-mail correto e que já está cadastrado
    Então o sistema não executa nenhuma ação

  Cenário: Envio de E-mail para E-mail Cadastrado
    Dado que o Usuário esteja na página de Recuperação de Senha (/forgot-password)
    Quando clicar no botão "Recuperar", após preencher o campo de E-mail com um E-mail correto e cadastrado
    Então o sistema deve enviar o e-mail de recuperação ao usuário
    E exibir uma mensagem informando que o e-mail foi enviado

  Cenário: Solicitação - E-mail Não Cadastrado
    Dado que o Usuário esteja na página de Recuperação de Senha (/forgot-password)
    Quando preencher o campo de E-mail com um E-mail Incorreto/Não Cadastrado
    Então o sistema não executa nenhuma ação

  Cenário: Envio de E-mail para E-mail Não Cadastrado
    Dado que o Usuário esteja na página de Recuperação de Senha (/forgot-password)
    Quando clicar no botão "Recuperar", após preencher o campo de E-mail com um E-mail Incorreto/Não Cadastrado
    Então o sistema deve exibir uma mensagem informando que o e-mail não foi encontrado
    E não enviar o e-mail de recuperação

  Cenário: Solicitação - Parâmetro Vazio
    Dado que o Usuário esteja na página de Recuperação de Senha (/forgot-password)
    Quando deixar o campo de E-mail vazio
    Então o sistema não executa nenhuma ação

  Cenário: Envio de E-mail com Parâmetro Vazio
    Dado que o Usuário esteja na página de Recuperação de Senha (/forgot-password)
    Quando clicar no botão "Recuperar" após deixar o campo de E-mail vazio
    Então o sistema deve exibir uma mensagem exigindo que informe um e-mail
    E não enviar o e-mail de recuperação

  Cenário: Outros problemas
    Dado que o Usuário esteja na página de Recuperação de Senha (/forgot-password)
    Quando o sistema apresentar algum problema de conexão com o Backend ou outro problema não previsto
    E o Usuário clicar no botão "Recuperar"
    Então o sistema deve retornar um erro 500 - Internal Server Error, com uma mensagem apropriada ao usuário