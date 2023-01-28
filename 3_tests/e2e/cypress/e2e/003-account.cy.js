describe('003-update-account', () => {
    before('clear session', () => {
      cy.clearSession();
    });
  
    it('logs in', () => {
      cy.login('superadmin@app.com', 'password');
      cy.visit('/');
    });

    it('can see account page', () => {
        cy.get('#topbar').within(() => {
            cy.get('[data-cy="link-account-topbar"]')
                .should('be.visible')
                .should('not.be.empty')
                .click();
        });
    });

    it('validates form', () => {
        // this is an example of bad testing habits
        // in this example, we will not test for negative scenarios (i.e. when users use it in a manner it wasn't meant to be)
    });

    it('can update name', () => {
        // we will only test for positive scenarios (i.e. what we expect users to do in our pink little perfect world)
        cy.get('[data-cy="form-edit-account"]').should('be.visible').within(() => {
            cy.get('[data-cy="fld-name"]')
                .should('be.visible')
                .should('not.have.value', '')
                .clear()
                .should('be.empty')
                .type('Super Admin rename test');

            cy.get('[data-cy="fld-cur-pass"]')
                .should('be.visible')
                .clear()
                .type('password');

            cy.get('input:invalid').should('have.length', 0);

            cy.get('[data-cy="btn-submit"]').click();
        });

        cy.get('[data-cy="flash-notice-container"]').should('be.visible').within(() => {
            cy.get('[data-cy="lbl-flash-notice"]').its('length').should('eq', 1);
        });
        cy.get('[data-cy="link-account-topbar"]').click();

        // now let's be a lad and return it to its old value
        cy.get('[data-cy="form-edit-account"]').should('be.visible').within(() => {
            cy.get('[data-cy="fld-name"]')
                .should('be.visible')
                .should('have.value', 'Super Admin rename test')
                .clear()
                .should('be.empty')
                .type('Super Admin');
            
            cy.get('[data-cy="fld-cur-pass"]')
                .should('be.visible')
                .clear()
                .type('password');

            cy.get('input:invalid').should('have.length', 0);

            cy.get('[data-cy="btn-submit"]').click();
        });

        cy.get('[data-cy="flash-notice-container"]').should('be.visible').within(() => {
            cy.get('[data-cy="lbl-flash-notice"]').its('length').should('eq', 1);
        });
        cy.get('[data-cy="link-account-topbar"]').click();

        cy.get('[data-cy="fld-name"]')
            .should('be.visible')
            .should('have.value', 'Super Admin');

    });
});