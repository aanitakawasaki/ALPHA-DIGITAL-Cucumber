#language: pt
#encoding: utf-8

Funcionalidade: Nova Senha Para Recuperação

  Cenário: Parâmetros Válidos
    Dado que o Token seja válido e o usuário esteja na página de Definição de Nova Senha (/password-reset)
    Quando o usuário preencher os campos de Nova Senha de forma válida
    Então o sistema não executa nenhuma ação

  Cenário: Parâmetros Válidos
    Dado que o Token seja válido e o usuário esteja na página de Definição de Nova Senha (/password-reset)
    Quando o usuário clicar no botão "Alterar", após executar o passo 1
    Então o sistema irá alterar a senha do usuário 
    E exibir uma mensagem informando que "A senha foi alterado com sucesso"

  Cenário: Senha Fraca/Inválida
    Dado que o Token seja válido e o usuário esteja na página de Definição de Nova Senha (/password-reset)
    Quando a senha informanda for inválida (curta, fraca ou que não atenda todos os critérios de segurança)
    Então o campo de Senha deve ser sinalizado visualmente como Inválido ou Senha Fraca

  Cenário: Senha Fraca/Inválida
    Dado que o Token seja válido e o usuário esteja na página de Definição de Nova Senha (/password-reset)
    Quando o usuário clicar no botão "Alterar", após executar o passo 1
    Então o sistema deve exibir uma mensagem de Senha Inválida ou Fraca
    E não efetuar a alteração

  Cenário: Senhas não Coincidem
    Dado que o Token seja válido e o usuário esteja na página de Definição de Nova Senha (/password-reset)
    Quando as senhas informadas pelo usuário não coincidirem
    Então  os campos de Senha devem ser sinalizados visualmente como inválidos, informando que as Senhas não coincidem

  Cenário: Senhas não Coincidem
    Dado que o Token seja válido e o usuário esteja na página de Definição de Nova Senha (/password-reset)
    Quando o usuário clicar no botão "Alterar", após executar o passo 1
    Então o sistema deve exibir uma mensagem informando que as Senha não Coincidem 
    E não efetuar a alteração

  Cenário: Campos Vazios
    Dado que o Token seja válido e o usuário esteja na página de Definição de Nova Senha (/password-reset)
    Quando um mais campos não forem informados (vazio)
    Então o sistema não executa nenhuma ação

  Cenário: Campos Vazios
    Dado que o Token seja válido e o usuário esteja na página de Definição de Nova Senha (/password-reset)
    Quando o usuário clicar no botão "Alterar", após executar o passo 1
    Então o sistema deve exibir uma mensagem sinalizando visualmente e requisitando os respectivos campos a serem preenchidos

 Cenário: Outros problemas
    Dado que o Token seja válido e o usuário esteja na página de Definição de Nova Senha (/password-reset)
    Quando o sistema apresentar algum problema de conexão com o Backend ou outro problema não previsto 
    E o Usuário clicar no botão de "Alterar"
    Então o sistema deve retornar um erro 500 - Internal Server Error, com uma mensagem apropriada ao usuário