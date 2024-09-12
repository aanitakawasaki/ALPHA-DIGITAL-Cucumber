import { Given, When, Then } from "@cucumber/cucumber";
import { strict as assert } from "assert";

Given("que o usuário está na página de login", function () {
  // Simula que o usuário acessou a página de login
  this.page = "login";
});

When(
  "o usuário preenche o campo de E-mail com um E-mail {string}",
  function (emailType) {
    // Simula o preenchimento do campo de E-mail com base no tipo de e-mail
    if (emailType === "válido") {
      this.email = "user@example.com"; // E-mail válido
    } else if (emailType === "não cadastrado") {
      this.email = "notfound@example.com"; // E-mail não cadastrado
    }
  }
);

When(
  "o usuário preenche o campo de Senha com a senha {string}",
  function (passwordType) {
    // Simula o preenchimento do campo de Senha com base no tipo de senha
    if (passwordType === "correta") {
      this.password = "correctPassword"; // Senha correta
    } else if (passwordType === "incorreta") {
      this.password = "wrongPassword"; // Senha incorreta
    }
  }
);

When("o usuário deixa um ou mais campos obrigatórios em branco", function () {
  // Simula a situação em que os campos estão em branco
  this.email = "";
  this.password = "";
});

When("o usuário clica no botão de login", function () {
  // Simula o clique no botão de login e verifica a situação dos campos
  if (!this.email || !this.password) {
    this.loginStatus = "incompleto";
  } else if (this.email === "notfound@example.com") {
    this.loginStatus = "emailNotFound";
  } else if (this.password === "wrongPassword") {
    this.loginStatus = "incorrectPassword";
  } else {
    this.loginStatus = "success";
  }
});

When("o usuário clica no link {string}", function (linkText) {
  // Simula o clique em um link
  if (linkText === "Criar uma conta") {
    this.page = "cadastro"; // Redireciona para a página de cadastro
  }
});

When("ocorre um problema de conexão ou erro no sistema", function () {
  // Simula um erro de conexão ou erro interno no sistema
  this.systemError = true;
});

Then("o usuário deve ser redirecionado para a área logada", function () {
  // Verifica se o login foi bem-sucedido e o usuário foi redirecionado
  assert.strictEqual(this.loginStatus, "success");
});

Then(
  "o sistema deve exibir uma mensagem pedindo o preenchimento dos campos obrigatórios",
  function () {
    // Verifica se o sistema detectou campos obrigatórios em branco
    assert.strictEqual(this.loginStatus, "incompleto");
  }
);

Then(
  "o sistema deve exibir uma mensagem informando que o E-mail não foi encontrado",
  function () {
    // Verifica se o sistema exibiu uma mensagem de e-mail não cadastrado
    assert.strictEqual(this.loginStatus, "emailNotFound");
  }
);

Then(
  "o sistema deve exibir uma mensagem informando que a senha está incorreta",
  function () {
    // Verifica se o sistema exibiu uma mensagem de senha incorreta
    assert.strictEqual(this.loginStatus, "incorrectPassword");
  }
);

Then("o login não deve ser realizado", function () {
  // Verifica se o login não foi realizado em caso de erro
  assert.notStrictEqual(this.loginStatus, "success");
});

Then("o usuário deve ser redirecionado para a página de cadastro", function () {
  // Verifica se o usuário foi redirecionado para a página de cadastro
  assert.strictEqual(this.page, "cadastro");
});

Then("o sistema deve exibir uma mensagem de erro apropriada", function () {
  // Verifica se um erro de sistema ocorreu e se uma mensagem apropriada foi exibida
  assert.strictEqual(this.systemError, true);
});
