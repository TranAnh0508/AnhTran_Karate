Feature: Verify puchasing by a Guest
  Background:
    * startConfig('chrome_local')
    * def appData = data('tademostoreweb', 'app')
    * def computerAndOfficePage = locator('tademostoreweb', 'computerandofficepage')
    * def aboutUsPage = locator('tademostoreweb', 'aboutuspage')
    * def basePage = locator('tademostoreweb', 'basepage')
    * def cartPage = locator('tademostoreweb', 'cartpage')
    * def shopPage = locator('tademostoreweb', 'shoppage')

  Scenario: Verify puchasing by a Guest
    # Step 1: Navigate to app
    * driver appData.url

    # Step 2: Click on Cart icon in the top right of shopping page
    * mouse().move(basePage.cartIcon).click()
    And delay(2000)

    #Verify step 2
#    * match text(cartPage.emptyText) == 'YOUR SHOPPING CART IS EMPTY'

    # Step3: Click on "Return to Shop" button
    * mouse().move(cartPage.returnShopButton).click()
    And delay(3000)
    * match text(shopPage.shopTitle) == 'Shop'

    # Step4: In Shop page, click on "cart" icon to add a product to cart
    * def cartCount = text(basePage.cartCount)
    * print 'Cart Count:', cartCount
    * mouse().move(shopPage.currentProduct).go()
    And mouse().move(shopPage.cartIcon).click()
    And delay(2000)
    * def cartCountLater = text(basePage.cartCount)
    * print 'Expected value:', cartCountLater

    # Set the Product Model's attributes
    * def productName = 'AirPods'
    * def productPrice = '290.00'

    # VP: Verify Cart icon number at the top right of shopping page is increased correctly
    * assert cartCountLater != cartCount

    # Step5: Click on Cart icon in the top right of shopping page
    * mouse().move(basePage.cartIcon).click()
    And delay(2000)

#    * def classValue = attribute(cartPage.shoppingCartText, 'class')
#    * print 'Class attribute value:', classValue
#    * match classValue.includes('active') == true
#
#    # Verify the Texts are displayed correctly
##    * match attribute(cartPage.shoppingCartText, 'class').includes('active')
#    And match attribute(cartPage.checkoutText, 'class') != 'active'
#    And match attribute(cartPage.orderStatusText, 'class') != 'active'

    # Verify corrected item
#    * match text(cartPage.orderStatusText) == productModelName
#    And match text(cartPage.orderStatusText) == productPrice

    # Step6: Click on "Process to checkout" button
    * mouse().move(cartPage.proceedToCheckoutBtn).click()
