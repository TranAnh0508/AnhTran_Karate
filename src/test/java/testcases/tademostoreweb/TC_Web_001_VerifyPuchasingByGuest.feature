Feature: Verify puchasing by a Guest
  Background:
    * startConfig('chrome_local')
    * def appData = data('tademostoreweb', 'app')
    * def computerAndOfficePage = locator('tademostoreweb', 'computerandofficepage')
    * def aboutUsPage = locator('tademostoreweb', 'aboutuspage')
    * def basePage = locator('tademostoreweb', 'basepage')
    * def cartPage = locator('tademostoreweb', 'cartpage')
    * def shopPage = locator('tademostoreweb', 'shoppage')
    * def popup = locator('tademostoreweb', 'popup')

  Scenario: Verify puchasing by a Guest
    # Step 1: Navigate to app
    * driver appData.url

    # Step 2: Click on Cart icon in the top right of shopping page
    * mouse().move(basePage.cartIcon).click()
    # Verify step 2
    * match text(cartPage.emptyText) == 'YOUR SHOPPING CART IS EMPTY'

    # Step3: Click on "Return to Shop" button
    * mouse().move(cartPage.returnShopButton).click()
    # Verify step 3
    * match text(shopPage.shopTitle) == 'Shop'

    # Step4: In Shop page, click on "cart" icon to add a product to cart
    * def cartCount = text(basePage.cartCount)
    * def countNumber = karate.eval('parseInt(cartCount)')

    * delay(1000)
    * waitFor(popup.popupCloseButton).click()
    * delay(1000)
    * mouse().move(shopPage.currentProduct).go()
    * mouse().move(shopPage.cartIcon).click()

    * delay(1000)
    * def cartCountLater = text(basePage.cartCount)
    * def countLaterNumber = karate.eval('parseInt(cartCountLater)')

    # VP: Verify Cart icon number at the top right of shopping page is increased correctly
    * assert countLaterNumber == countNumber + 1

    # Step5: Click on Cart icon in the top right of shopping page
    * mouse().move(basePage.cartButton).click()

    * def classValue = attribute(cartPage.shoppingCartText, 'class')
    * print 'Class attribute value:', classValue
    * match classValue.includes('active') == true
#
#    # Verify the Texts are displayed correctly
##    * match attribute(cartPage.shoppingCartText, 'class').includes('active')
#    And match attribute(cartPage.checkoutText, 'class') != 'active'
#    And match attribute(cartPage.orderStatusText, 'class') != 'active'

    # Verify corrected item
#    * match text(cartPage.orderStatusText) == productModelName
#    And match text(cartPage.orderStatusText) == productPrice

    # Step6: Click on "Process to checkout" button
#    * mouse().move(cartPage.proceedToCheckoutBtn).click()

    # Verify step 6

    # Step 7: Enter required fields  then click on "Place Order" button

