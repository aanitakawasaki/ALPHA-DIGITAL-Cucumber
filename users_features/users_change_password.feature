#language: pt
#encoding: utf-8

Funcionalidade: Alterar Senha do Usuário

  Cenário: Todos os parâmetros válidos
    Dado que o Usuário esteja na página de Perfil de Usuário (/profile)
    Quando o usuário preencher o campo "Senha atual" com uma senha válida (atenda os critérios de segurança)
    Então o sistema deve desbloquear os campos "Nova senha" e "Confirmar senha" para digitação

  Cenário: Todos os parâmetros válidos
    Dado que o Usuário esteja na página de Perfil de Usuário (/profile) 
    E tenha preenchido a "Senha atual" de forma válida
    Quando preencher o campo de "Nova senha" com uma senha válida (atenda os critérios e segurança)
    Então o sistema não executa nenhuma ação

  Cenário: Todos os parâmetros válidos
    Dado que o Usuário esteja na página de Perfil de Usuário (/profile) 
    E tenha preenchido a "Senha atual" de forma válida
    Quando preencher o campo de "Confirmar senha" com a senha correta (igual a Nova senha)
    Então o sistema não executa nenhuma ação

  Cenário: Todos os parâmetros válidos
    Dado que o Usuário esteja na página de Perfil de Usuário (/profile) 
    E tenha executado os passos de 1 a 3
    Quando clicar no botão "Salvar"
    Então o sistema executa a atualização da senha 
    E exibe uma mensagem informando que a senha foi alterada

  Cenário: Senha atual válida, mas incorreta
    Dado que o Usuário esteja na página de Perfil de Usuário (/profile) 
    Quando o usuário preencher o campo "Senha atual" com uma senha válida (atenda os critérios de segurança), mas que esteja incorreta (não seja a real senha do usuário)
    Então o sistema deve desbloquear os campos "Nova senha" e "Confirmar senha" para digitação

  Cenário: Senha atual válida, mas incorreta
    Dado  que o Usuário esteja na página de Perfil de Usuário (/profile) 
    E tenha preenchido a "Senha atual" de forma válida
    Quando preencher o campo de "Nova senha" com uma senha válida (atenda os critérios e segurança)
    Então o sistema não executa nenhuma ação

  Cenário: Senha atual válida, mas incorreta
    Dado que o Usuário esteja na página de Perfil de Usuário (/profile) 
    E tenha preenchido a "Senha atual" de forma válida
    Quando preencher o campo de "Confirmar senha" com a senha correta (igual a Nova senha)
    Então o sistema não executa nenhuma ação

  Cenário: Senha atual válida, mas incorreta
    Dado que o Usuário esteja na página de Perfil de Usuário (/profile) 
    E tenha executado os passos de 1 a 3
    Quando clicar no botão "Salvar"
    Então o sistema executa a validação da senha atual 
    E não efetua a alteração
    E exibe uma mensagem informando que a senha atual está incorreta

  Cenário: Senha atual inválida
    Dado que o Usuário esteja na página de Perfil de Usuário (/profile) 
    Quando o usuário preencher o campo "Senha atual" com uma senha inválida (não atenda os critérios de segurança)
    Então o campo de "Senha atual" deve ser sinalizado visualmente como inválido
    E informar também os critérios não atendidos

  Cenário: Senha atual inválida
    Dado que o Usuário esteja na página de Perfil de Usuário (/profile) 
    E tenha preenchido a "Senha atual" de forma inválida
    Quando o usuário clicar no campo de "Nova senha"
    Então o sistema não deve permite que o usuário digite, deixando o campo bloqueado

  Cenário: Senha atual inválida
    Dado que o Usuário esteja na página de Perfil de Usuário (/profile) 
    E tenha preenchido a "Senha atual" de forma inválida
    Quando o usuário clicar no campo de "Confirmar senha"
    Então o sistema não deve permite que o usuário digite, deixando o campo bloqueado

  Cenário: Senha atual inválida
    Dado que o Usuário esteja na página de Perfil de Usuário (/profile) 
    E executado os passos de 1 a 3
    Quando o usuário clicar no botão "Salvar"
    Então o sistema não deve executar nenhuma ação, deixando o botão bloqueado

  Cenário: Nova senha inválida
    Dado que o Usuário esteja na página de Perfil de Usuário (/profile)
    E preenchido a "Senha atual" de forma válida
    Quando preencher o campo de "Nova senha" com uma senha inválida (não atenda os critérios e segurança)
    Então o campo de "Nova senha" deve ser sinalizado visualmente como inválido, informando também os critérios não atendidos

  Cenário: Nova senha inválida
    Dado que o Usuário esteja na página de Perfil de Usuário (/profile)
    E preenchido a "Senha atual" de forma válida
    Quando preencher o campo de "Confirmar senha" com a senha correta (igual a Nova senha)
    Então o sistema não executa nenhuma ação

  Cenário: Nova senha inválida
    Dado que o Usuário esteja na página de Perfil de Usuário (/profile)
    E executado os passos de 1 a 2
    Quando o usuário clicar no botão "Salvar"
    Então o sistema não deve executar nenhuma ação, deixando o botão bloqueado

  Cenário: Confirmar senha diferente da nova
    Dado que o Usuário esteja na página de Perfil de Usuário (/profile) 
    E preenchido a "Senha atual" de forma válida
    Quando preencher o campo de "Nova senha" com uma senha válida (atenda os critérios e segurança)
    Então o sistema não executa nenhuma ação

  Cenário: Confirmar senha diferente da nova
    Dado que o Usuário esteja na página de Perfil de Usuário (/profile) 
    E preenchido a "Senha atual" de forma válida
    Quando preencher o campo de "Confirmar senha" com a senha incorreta (diferente da Nova senha)
    Então o campo de "Confirmar senha" deve ser sinalizado visualmente como inválido
    E exibir uma mensagem que as senhas não coincidem

  Cenário: Confirmar senha diferente da nova
    Dado que o Usuário esteja na página de Perfil de Usuário (/profile) 
    E executado os passos de 1 a 2.
    Quando o usuário clicar no botão "Salvar"
    Então o sistema não deve executar nenhuma ação, deixando o botão bloqueado

  Cenário: Outros problemas
    Dado que o Usuário esteja na página de Cadastro de Usuário (/sign-up)
    Quando o sistema apresentar algum problema de conexão com o Backend ou outro problema não previsto
    E o Usuário clicar no botão de Cadastrar
    Então o sistema deve retornar um erro 500 - Internal Server Error, com uma mensagem apropriada ao usuário