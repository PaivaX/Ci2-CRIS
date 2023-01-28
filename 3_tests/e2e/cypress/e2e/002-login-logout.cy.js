describe('002-login', () => {
    before('clear session', () => {
        cy.clearSession();
    });

    it('visis homepage', () => {
        cy.visit('/');
    });

    it('sees & clicks on login btn', () => {
        cy.get('#topbar').within(() => {
            cy.get('[data-cy="link-login-topbar"]')
                .should('be.visible')
                .should('not.be.empty')
                .click();
        });
    });

    it('gets redirected to login page', () => {
        cy.url().should('include', '/sign_in');
    });

    it('sees login form and validates', () => {
        cy.get('[data-cy="form-login"]').should('be.visible').within(() => {
            cy.get('input:invalid').should('have.length', 0);

            cy.get('[data-cy="fld-email"]')
                .should('be.visible')
                .should('be.empty')
                .type('invalid-email');

            cy.get('[data-cy="fld-pass"]')
                .should('be.visible')
                .should('be.empty')
                .type('password');

            cy.get('[data-cy="btn-login"]').click();

            cy.get('input:invalid').should('have.length', 1);
            cy.get('[data-cy="fld-email"]').then(($input) => {
                expect($input[0].validationMessage).to.contain('email');
                expect($input[0].validationMessage).to.have.length.gt(5);
            });

            cy.url().should('include', '/sign_in'); // verify that we are still in the login page
        });
    });

    const loginFnc = function (email, password) {
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
    };

    it('rejects wrong email or password', () => {
        // invalid email
        loginFnc('alskdfj2309847290@app.com', 'password');
        cy.get('[data-cy="flash-alert-container"]').should('be.visible').within(() => {
            cy.get('[data-cy="lbl-flash-alert"]').its('length').should('eq', 1);
        });
        cy.url().should('include', '/sign_in');

        // invalid password
        loginFnc('superadmin@app.com', 'wrong-password');
        cy.get('[data-cy="flash-alert-container"]').should('be.visible').within(() => {
            cy.get('[data-cy="lbl-flash-alert"]').its('length').should('eq', 1);
        });
        cy.url().should('include', '/sign_in');
    });

    it('logs in', () => {
        loginFnc('superadmin@app.com', 'password');
        cy.get('[data-cy="flash-notice-container"]').should('be.visible').within(() => {
            cy.get('[data-cy="lbl-flash-notice"]').its('length').should('eq', 1);
        });
        cy.url().should('not.include', '/sign_in'); // verify that we are not in the login page
    });

    it('cannot go to login page manually', () => {
        cy.visit('/users/sign_in');
        cy.get('[data-cy="flash-alert-container"]').should('be.visible').within(() => {
            cy.get('[data-cy="lbl-flash-alert"]').its('length').should('eq', 1);
        });
        cy.url().should('not.include', '/sign_in');
    });

    it('can access personal page', () => {
        cy.get('#topbar').within(() => {
            cy.get('[data-cy="link-account-topbar"]')
                .should('be.visible')
                .should('not.be.empty')
                .click();
        });

        cy.get('[data-cy="form-edit-account"]').should('be.visible');
    });

    it('logs out', () => {
        cy.get('#topbar').within(() => {
            cy.get('[data-cy="link-logout-topbar"]')
                .should('be.visible')
                .should('not.be.empty')
                .click();

            cy.get('[data-cy="link-logout-topbar"]').should('not.exist');
            cy.get('[data-cy="link-login-topbar"]').should('be.visible');
        });

        cy.get('[data-cy="flash-notice-container"]').should('be.visible').within(() => {
            cy.get('[data-cy="lbl-flash-notice"]').its('length').should('eq', 1);
            cy.get('[data-cy="lbl-flash-notice"]').should('contain', 'Signed out successfully.'); // ideally we should not check for texts like this, as they are prone to change. This is meant as an example
        });
    });
});