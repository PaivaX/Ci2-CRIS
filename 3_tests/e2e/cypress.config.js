const { defineConfig } = require("cypress");

module.exports = defineConfig({
  e2e: {
    setupNodeEvents(on, config) {
      // implement node event listeners here
    },
    baseUrl: 'http://localhost:3000', // without trailing slash e.g. http://localhost:3000
    testIsolation: false, // it() statements are not isolated!
    viewportWidth: 1920,
    viewportHeight: 1080
  },
});
