#language: pt
#encoding: utf-8

Funcionalidade: Cadastro de Usuário

  Como um usuário autenticado
  Eu quero cadastrar um novo usuário
  Para que eu possa criar contas para novos usuários no sistema

  Cenário: Preenchimento correto dos campos
    Dado que o Usuário esteja na página de Cadastro de Usuário (/sign-up)
    Quando preencher o campo de Nome com um Nome válido
    E preencher o campo de E-mail com um E-mail válido
    E preencher o campo de Senha com uma Senha válida
    E preencher o campo de Repita a Senha com a senha correspondente
    E selecionar uma opção de cargo
    E pressionar o botão Cadastrar
    Então o sistema deve exibir uma mensagem de Sucesso
    E efetuar o cadastro

  Cenário: Campos obrigatórios em branco
    Dado que o Usuário esteja na página de Cadastro de Usuário (/sign-up)
    Quando não preencher (deixar em branco) um ou mais campos
    Então todos os campos não informados devem ser sinalizados visualmente como Inválidos
    E informar também em texto que eles são obrigatórios

  Cenário: Campos obrigatórios em branco após clicar em Cadastrar
    Dado que o Usuário esteja na página de Cadastro de Usuário (/sign-up)
    Quando não preencher (deixar em branco) um ou mais campos
    E pressionar o botão Cadastrar
    Então o sistema deve exibir uma mensagem informando todos os campos inválidos
    E não efetuar o cadastro

  Cenário: Nome inválido
    Dado que o Usuário esteja na página de Cadastro de Usuário (/sign-up)
    Quando preencher o campo de Nome com um Nome inválido
    Então o campo de Nome deve ser sinalizado visualmente como inválido

  Cenário: E-mail inválido
    Dado que o Usuário esteja na página de Cadastro de Usuário (/sign-up)
    Quando preencher o campo de E-mail com um E-mail inválido
    Então o campo de E-mail deve ser sinalizado visualmente como inválido

  Cenário: Senha inválida
    Dado que o Usuário esteja na página de Cadastro de Usuário (/sign-up)
    Quando preencher o campo de Senha com uma Senha inválida (curta, fraca ou que não atenda todos os critérios de segurança)
    Então o campo de Senha deve ser sinalizado visualmente como inválido ou senha fraca

  Cenário: Senha e Repetição de Senha não coincidem
    Dado que o Usuário esteja na página de Cadastro de Usuário (/sign-up)
    Quando preencher o campo de Senha com uma Senha válida
    E preencher o campo de Repetir a Senha com uma Senha diferente (não coincide com a senha do campo anterior)
    Então os campos de Senha devem ser sinalizados visualmente como inválidos
    E informar que as Senhas não coincidem

  Cenário: Cargo não selecionado
    Dado que o Usuário esteja na página de Cadastro de Usuário (/sign-up)
    Quando não selecionar nenhuma opção de cargo
    Então o sistema deve exibir uma mensagem de Cargo não Informado
    E não efetuar o cadastro

  Cenário: E-mail já utilizado
    Dado que o Usuário esteja na página de Cadastro de Usuário (/sign-up)
    Quando preencher o campo de E-mail com um E-mail que já foi utilizado
    Então o campo de E-mail deve ser sinalizado visualmente como inválido
    E informar que o E-mail informado já está em uso

  Cenário: Link para página de Login
    Dado que o Usuário esteja na página de Cadastro de Usuário (/sign-up)
    Quando clicar no botão/link de "Já possuo uma conta"
    Então o sistema deve redirecionar o Usuário para a página de Login (/sign-in)

  Cenário: Problemas de conexão ou erro interno
    Dado que o Usuário esteja na página de Cadastro de Usuário (/sign-up)
    Quando o sistema apresentar algum problema de conexão com o Backend ou outro problema não previsto
    E o Usuário clicar no botão de Cadastrar
    Então o sistema deve retornar um erro 500 - Internal Server Error, com uma mensagem apropriada ao usuário
