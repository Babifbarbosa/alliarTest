Cypress.on("uncaught:exception", (err, runnable) => {
  return false;
});

describe("Pesquisa valida no OLX", () => {
  beforeEach(() => {
    cy.visit("https://www.olx.com.br/");
  });

  it("Caso 1: Pesquisa válida", () => {
    cy.get("input[data-testid=searchtext-input]").clear().type("iphone{enter}");
    cy.screenshot("pesquisaValida");
  });
  it("Caso 2: Pesquisa invalida no OLX", () => {
    cy.get("input[data-testid=searchtext-input]")
      .clear()
      .type("ipjjjone{enter}");
    cy.contains("Ops! Nenhum anúncio foi encontrado.");
    cy.screenshot("pesquisaInvalida");
  });
});
