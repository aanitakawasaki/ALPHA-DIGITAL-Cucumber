#language: pt
#encoding: utf-8

Funcionalidade: Buscar Usuário e Exibir seus Dados

  Cenário: Nome válido
    Dado que o Usuário esteja na página de Perfil de Usuário (/profile)
    Quando o usuário preencher o campo "Nome completo" com um nome válido
    Então o sistema não executa nenhuma ação

  Cenário: Nome válido
    Dado que o Usuário esteja na página de Perfil de Usuário (/profile)
    E tenha preenchido o campo "Nome completo" de forma válida
    Quando o usuário preencher o campo "Senha atual" com a senha correta
    Então o sistema não executa nenhuma ação

  Cenário: Nome válido
    Dado que o Usuário esteja na página de Perfil de Usuário (/profile)
    E executado os passos de 1 a 2
    Quando clicar no botão "Salvar"
    Então o sistema executa a atualização do Nome 
    E exibe uma mensagem informando que os dados foram atualizados