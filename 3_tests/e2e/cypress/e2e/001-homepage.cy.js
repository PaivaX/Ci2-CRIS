describe('001-homepage', () => {
    before('clear session', () => {
        cy.clearSession();
    });

    it('visis homepage', () => {
        cy.visit('/');
    });

    it('sees contact email', () => {
        cy.get('#topbar > .container > .contact-info') // example without using data-cy locaters, not recommended at all
            .should('be.visible')
            .contains('geral@ipt.pt');
    });

    it('sees center title and description', () => {
        cy.get('[data-cy="lbl-the-center-title"]') // safer to use data-cy locaters, however make sure they are globally unique!
            .should('be.visible')
            .contains('O Centro');

        cy.get('[data-cy="lbl-the-center-desc"]')
            .should('be.visible')
            .should('not.be.empty');
    });
});