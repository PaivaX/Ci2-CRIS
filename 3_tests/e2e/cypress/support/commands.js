// ***********************************************
// This example commands.js shows you how to
// create various custom commands and overwrite
// existing commands.
//
// For more comprehensive examples of custom
// commands please read more here:
// https://on.cypress.io/custom-commands
// ***********************************************
//
//
// -- This is a parent command --
// Cypress.Commands.add('login', (email, password) => { ... })
//
//
// -- This is a child command --
// Cypress.Commands.add('drag', { prevSubject: 'element'}, (subject, options) => { ... })
//
//
// -- This is a dual command --
// Cypress.Commands.add('dismiss', { prevSubject: 'optional'}, (subject, options) => { ... })
//
//
// -- This will overwrite an existing command --
// Cypress.Commands.overwrite('visit', (originalFn, url, options) => { ... })

Cypress.Commands.add('clearSession', () => {
    cy.clearAllCookies();
    cy.clearAllLocalStorage();
    cy.clearAllSessionStorage();
});

Cypress.Commands.add('login', (email, password) => {
    cy.session(email, () => {
        cy.visit('/users/sign_in');
    
        cy.get('[data-cy="form-login"]').should('be.visible').within(() => {
            cy.get('[data-cy="fld-email"]')
                .should('be.visible')
                .clear()
                .should('be.empty')
                .type(email);
    
            cy.get('[data-cy="fld-pass"]')
                .should('be.visible')
                .clear()
                .should('be.empty')
                .type(password);
    
            cy.get('input:invalid').should('have.length', 0);
    
            cy.get('[data-cy="btn-login"]').click();
        });
    
        cy.url().should('not.include', '/sign_in');
    });
});