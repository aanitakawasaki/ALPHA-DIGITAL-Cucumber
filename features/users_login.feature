Feature: Login de usuário

  Scenario: Login com credenciais corretas
    Given que o usuário está na página de login
    When o usuário preenche o campo de E-mail com um E-mail válido
    And o usuário preenche o campo de Senha com a senha correta
    And o usuário clica no botão de login
    Then o usuário deve ser redirecionado para a área logada

  Scenario: Campos obrigatórios em branco
    Given que o usuário está na página de login
    When o usuário deixa um ou mais campos obrigatórios em branco
    And o usuário clica no botão de login
    Then o sistema deve exibir uma mensagem pedindo o preenchimento dos campos obrigatórios
    And o login não deve ser realizado

  Scenario: E-mail incorreto
    Given que o usuário está na página de login
    When o usuário preenche o campo de E-mail com um E-mail não cadastrado
    And o usuário preenche o campo de Senha corretamente
    And o usuário clica no botão de login
    Then o sistema deve exibir uma mensagem informando que o E-mail não foi encontrado
    And o login não deve ser realizado

  Scenario: Senha incorreta
    Given que o usuário está na página de login
    When o usuário preenche o campo de E-mail com um E-mail válido
    And o usuário preenche o campo de Senha com uma senha incorreta
    And o usuário clica no botão de login
    Then o sistema deve exibir uma mensagem informando que a senha está incorreta
    And o login não deve ser realizado

  Scenario: Link para página de cadastro
    Given que o usuário está na página de login
    When o usuário clica no link "Criar uma conta"
    Then o usuário deve ser redirecionado para a página de cadastro

  Scenario: Problemas de conexão ou erro interno
    Given que o usuário está na página de login
    When ocorre um problema de conexão ou erro no sistema
    And o usuário clica no botão de login
    Then o sistema deve exibir uma mensagem de erro apropriada
