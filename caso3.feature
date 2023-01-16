Feature: Cadastro de Dados Pessoais
  Como um usuário do site Cartão aliança
  Eu quero poder me cadastrar fornecendo minhas informações pessoais
  Para que eu possa ter acesso ao plano anual, e aos beneficios do cartão

Scenario: Cadastro com sucesso
  Given que eu esteja na página de cadastro
  When preencho os campos "Nome", "CPF", "Data de nascimento", "Telefone", "E-mail", "Senha" e "Confirmacao de senha" com valores válidos
  And clico no botão "Continuar"
  Then eu devo ser redirecionado para a página de cadastro de endereço

Scenario: Cadastro com falha - campos vazios
  Given que eu esteja na página de cadastro
  When clico no botão "Continuar" sem preencher nenhum campo
  Then eu devo permanecer na página de cadastro
  And as mensagens de erro "Campo obrigatorio" para todos os campos em branco devem ser exibidas

Scenario: Cadastro com falha - nome curto
  Given que eu esteja na página de cadastro
  When clico no botão "Continuar" preenchendo o campo "Nome" com menos de 3 algaritmos
  Then eu devo permanecer na página de cadastro
  And as mensagens de erro "Informe um nome com minimo de 3 algaritmos" deve ser exibida.

Scenario: Cadastro com falha - cpf inexistente
  Given que eu esteja na página de cadastro
  When preencho o campo "CPF" com um cpf que nao existe
  And clico no botão "Continuar"
  Then eu devo permanecer na página de cadastro
  And a mensagem de erro "CPF inválido" deve ser exibida

Scenario: Cadastro com falha - data de nascimento em formato incorreto
  Given que eu esteja na página de cadastro
  When preencho o campo "Data de nascimento" com um numero de dia > 31 ou mes > 12 ou ano > 2005
  And clico no botão "Continuar"
  Then eu devo permanecer na página de cadastro
  And a mensagem de erro "Data de nascimento incorreta" deve ser exibida

Scenario: Cadastro com falha - email ja cadastrado
  Given que eu esteja na página de cadastro
  When preencho o campo "E-mail" com um endereço já cadastrado no sistema
  And clico no botão "Continuar"
  Then eu devo permanecer na página de cadastro
  And a mensagem de erro "E-mail já cadastrado" deve ser exibida

Scenario: Cadastro com falha - email fora de formato
  Given que eu esteja na página de cadastro
  When preencho o campo "E-mail" com um endereço sem @ ou . 
  And clico no botão "Continuar"
  Then eu devo permanecer na página de cadastro
  And a mensagem de erro "E-mail em formato incorreto" deve ser exibida

Scenario: Cadastro com falha - senhas não são iguais
  Given que eu esteja na página de cadastro
  When preencho o campo "Senha" e "Confirmacao de senha" com senhas diferentes
  And clico no botão "Continuar"
  Then eu devo permanecer na página de cadastro
  And a mensagem de erro "As senhas devem ser iguais" deve ser exibida

