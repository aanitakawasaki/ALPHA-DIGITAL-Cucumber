#language: pt
#encoding: utf-8

Funcionalidade: Token de E-mail de Confirmação

  Cenário: Token válido
    Dado que o Usuário tenha recebido o e-mail de confirmação de cadastro
    Quando abrir o link de confirmação contido no e-mail
    E este link conter um token Válido
    Então o sistema deve conter:
      | 1. Validar token |
      | 2. Efetuar a atualização do status do cadastro do usuário |
      | 3. Exibir uma mensagem informando que a validação da conta foi confirmada com sucesso |

  Cenário: Token expirado
    Dado que o Usuário tenha recebido o e-mail de confirmação de cadastro
    Quando abrir o link de confirmação contido no e-mail
    E este link conter um token Válido
    Então o sistema deve conter:
      | 1. Validar o token |
      | 2. Não efetuar a atualização do status do cadastro do usuário |
      | 3. Exibir uma mensagem informando que o token está Expirado |
      | 4. Requisitar que o usuário efetue uma nova solicitação |

  Cenário: Token inválido
    Dado que o Usuário tenha recebido o e-mail de confirmação de cadastro
    Quando abrir o link de confirmação contido no e-mail
    E este link conter um token Inválido
    Então o sistema deve conter:
      | 1. Validar o token |
      | 2. Não efetuar a atualização do status do cadastro do usuário |
      | 3. Exibir uma mensagem informando que o token está inválido |
      | 4. Requisitar que o usuário efetue uma nova solicitação |

  Cenário: Outros problemas
    Dado que o Usuário esteja na página de Cadastro de Usuário (/sign-up)
    Quando o sistema apresentar algum problema de conexão com o Backend ou outro problema não previsto
    E o Usuário clicar no botão de Cadastrar
    Então o sistema deve retornar um erro 500 - Internal Server Error, com uma mensagem apropriada ao usuário