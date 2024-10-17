Feature: Verify creating and activating an account
  Background:
    * startConfig('chrome_local')
    * def appData = data('tademostoreweb', 'app')
    * def computerAndOfficePage = locator('tademostoreweb', 'computerandofficepage')
    * def aboutUsPage = locator('tademostoreweb', 'aboutuspage')
    * def basePage = locator('tademostoreweb', 'basepage')
    * def cartPage = locator('tademostoreweb', 'cartpage')
    * def shopPage = locator('tademostoreweb', 'shoppage')
    * def popup = locator('tademostoreweb', 'popup')

  Scenario: Verify creating and activating an account
    # Step 1: Navigate to app
    * driver appData.url

    # Step 2: Click Log in / Sign up in the top page
