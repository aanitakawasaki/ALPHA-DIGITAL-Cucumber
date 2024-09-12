#language: pt
#encoding: utf-8

Funcionalidade: Alterar Dados do Usuário

  Como um usuário autenticado
  Eu quero poder alterar meus dados pessoais na plataforma
  Para que eu possa manter minhas informações sempre atualizadas

  Cenário: Todos os parâmetros válidos
    Dado que o Usuário esteja na página de Perfil de Usuário (/profile)
    Quando o usuário preencher o campo "Nome completo" com um nome válido
    Então o sistema não executa nenhuma ação

  Cenário: Todos os parâmetros válidos
    Dado que o Usuário esteja na página de Perfil de Usuário (/profile)
    E tenha preenchido o campo "Nome completo" de forma válida
    Quando o usuário preencher o campo "Senha atual" com a senha correta
    Então o sistema não executa nenhuma ação

  Cenário: Atualizar Nome completo com todos os parâmetros válidos
    Dado que o Usuário esteja na página de Perfil de Usuário (/profile)
    E tenha executado os passos de 1 a 2
    Quando clicar no botão "Salvar"
    Então o sistema executa a atualização do Nome completo
    E exibe uma mensagem informando que os dados foram atualizados

  Cenário: Nome em branco
    Dado que o Usuário esteja na página de Perfil de Usuário (/profile)
    Quando o usuário deixar o campo "Nome completo" em branco (não inserir nenhum valor)
    Então o campo de "Nome completo" deve ser sinalizado visualmente como inválido
    E informar em texto que ele é obrigatório

  Cenário: Nome em branco e preenchimento da Senha atual
    Dado que o Usuário esteja na página de Perfil de Usuário (/profile)
    E tenha deixado o campo "Nome completo" em branco
    Quando o usuário preencher o campo "Senha atual" com a senha correta
    Então o sistema não executa nenhuma ação

  Cenário: Nome em branco e tentativa de salvar
    Dado que o Usuário esteja na página de Perfil de Usuário (/profile)
    E tenha deixado o campo "Nome completo" em branco
    Quando clicar no botão "Salvar"
    Então o sistema não deve executar nenhuma ação, deixando o botão bloqueado

  Cenário: E-mail válido
    Dado que o Usuário esteja na página de Perfil de Usuário (/profile)
    Quando o usuário preencher o campo "E-mail" com um e-mail válido
    Então o sistema não executa nenhuma ação

  Cenário: Atualizar E-mail com todos os parâmetros válidos
    Dado que o Usuário esteja na página de Perfil de Usuário (/profile)
    E tenha preenchido o campo "E-mail" de forma válida
    Quando o usuário preencher o campo "Senha atual" com a senha correta
    E clicar no botão "Salvar"
    Então o sistema executa a atualização do E-mail
    E exibe uma mensagem informando que os dados foram atualizados

  Cenário: E-mail inválido
    Dado que o Usuário esteja na página de Perfil de Usuário (/profile)
    Quando o usuário preencher o campo "E-mail" com um e-mail inválido
    Então o campo de "E-mail" deve ser sinalizado visualmente como inválido
    E informar em texto que o e-mail é inválido

  Cenário: E-mail inválido e tentativa de salvar
    Dado que o Usuário esteja na página de Perfil de Usuário (/profile)
    E tenha preenchido o campo "E-mail" de forma inválida
    Quando clicar no botão "Salvar"
    Então o sistema não deve executar nenhuma ação, deixando o botão bloqueado

  Cenário: E-mail em uso
    Dado que o Usuário esteja na página de Perfil de Usuário (/profile)
    Quando o usuário preencher o campo "E-mail" com um e-mail já utilizado por outro usuário
    Então o sistema deve informar que o e-mail já está em uso

  Cenário: Foto de perfil válida
    Dado que o Usuário esteja na página de Perfil de Usuário (/profile)
    Quando o usuário selecionar uma foto válida (arquivo com extensão de imagem)
    Então o sistema deve fazer o upload da imagem e exibi-la

  Cenário: Atualizar Foto de perfil com todos os parâmetros válidos
    Dado que o Usuário esteja na página de Perfil de Usuário (/profile)
    E tenha selecionado uma foto válida
    Quando clicar no botão "Salvar"
    Então o sistema executa a atualização da Foto de perfil
    E exibe uma mensagem informando que os dados foram atualizados

  Cenário: Foto de perfil inválida
    Dado que o Usuário esteja na página de Perfil de Usuário (/profile)
    Quando o usuário selecionar uma foto inválida (arquivo com extensão diferente de imagem)
    Então o sistema não deve fazer upload
    E deve exibir uma mensagem informando que o formato de imagem selecionado não é válido

  Cenário: Outros problemas
    Dado que o Usuário esteja na página de Perfil de Usuário (/profile)
    Quando o sistema apresentar algum problema de conexão com o Backend ou outro problema não previsto
    E o Usuário clicar no botão de "Salvar"
    Então o sistema deve retornar um erro 500 - Internal Server Error, com uma mensagem apropriada ao usuário
