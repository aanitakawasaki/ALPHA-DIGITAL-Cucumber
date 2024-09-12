#language: pt
#encoding: utf-8

Funcionalidade: Logout de Usuário

  Como um usuário autenticado
  Eu quero sair da plataforma
  Para que eu possa encerrar minha sessão com segurança

  Cenário: Exibir Menu Sanduíche
    Dado que o Usuário esteja autenticado (logado) e presente em alguma parte da Área Logada da plataforma
    Quando o usuário clicar no Menu Sanduíche no lado superior direito da tela
    Então o sistema deve expandir o Menu Sanduíche
    E exibir suas opções

  Cenário: Logout e Invalidação do Token de Acesso
    Dado que o Usuário esteja autenticado (logado) e presente em alguma parte da Área Logada da plataforma
    Quando o usuário clicar no botão "Sair da plataforma" presente no Menu Sanduíche
    Então o sistema deve efetuar o logout do Usuário (/signout)
    E invalidar o seu token de acesso
    E redirecionar o Usuário para a página de login (/sign-in)
