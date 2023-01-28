describe('004-projects', () => {
    before('clear session', () => {
      cy.clearSession();
    });
  
    it('logs in', () => {
      cy.login('superadmin@app.com', 'password');
    });
    
    it('goes to projects', () => {
        cy.visit('/projects');
    });
});