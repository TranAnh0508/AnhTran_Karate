Feature: Verify clearing Shopping cart
  Background:
    * startConfig('chrome_local')
    * def appData = data('tademostoreweb', 'app')
    * def computerAndOfficePage = locator('tademostoreweb', 'computerandofficepage')
    * def aboutUsPage = locator('tademostoreweb', 'aboutuspage')
    * def basePage = locator('tademostoreweb', 'basepage')
    * def cartPage = locator('tademostoreweb', 'cartpage')
    * def shopPage = locator('tademostoreweb', 'shoppage')
    * def popup = locator('tademostoreweb', 'popup')

  Scenario: Verify clearing Shopping cart
    # Step 1: Navigate to app
    * driver appData.url

    # Step 2: Click on Shop link
    * mouse().move(basePage.shopLink).click()
    * waitForUrl('https://demo.testarchitect.com/shop/')

    # Step 3: Click on cart icon to add product to cart
    * delay(1000)
    * waitFor(popup.popupCloseButton).click()
    * delay(1000)
    * mouse().move(shopPage.currentProduct).go()
    * mouse().move(shopPage.cartIcon).click()

    # Step 4: Click on Cart icon at the top right of Shop page
    * mouse().move(basePage.cartButton).click()

    # Step 5: Click on "Clear Shopping Cart"
    * mouse().move(cartPage.clearCart).click()

