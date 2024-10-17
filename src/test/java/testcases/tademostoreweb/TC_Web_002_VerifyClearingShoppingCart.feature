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

    * def cartCount = text(basePage.cartCount)
    * def countNumber = karate.eval('parseInt(cartCount)')

    * mouse().move(shopPage.currentProduct).go()
    * mouse().move(shopPage.cartIcon).click()

    # Verify step 3
    * delay(1000)
    * def cartCountLater = text(basePage.cartCount)
    * def countLaterNumber = karate.eval('parseInt(cartCountLater)')
    * assert countLaterNumber == countNumber + 1

    * def product = 'AirPods'

    * def shopProductName = format(shopPage.productName, product)
    * scroll(shopProductName)
    * def shopName = text(shopProductName)

    * def shopProductPrice = format(shopPage.productPrice, product)
    * def shopPrice = text(shopProductPrice).replace('$', '').replace('.','')
    * def shopPriceNumber = karate.eval('parseInt(shopPrice)')

    # Step 4: Click on Cart icon at the top right of Shop page
    * scroll(basePage.cartButton).click()

    # Verify step 4
    * def cartProductName = format(cartPage.productName, product)
    * def cartName = text(cartProductName)

    * def cartProductPrice = format(cartPage.productPrice, product)
    * def cartPrice = text(cartProductPrice).replace('$', '').replace('.','')
    * def cartPriceNumber = karate.eval('parseInt(cartPrice)')

    * def cartProductQuantity = format(cartPage.productQuantity, product)
    * def cartQuantity = value(cartProductQuantity)
    * def cartQuantityNumber = karate.eval('parseInt(cartQuantity)')

    * def cartProductSubtotal = format(cartPage.productSubtotal, product)
    * def cartSubtotal = text(cartProductSubtotal).replace('$', '').replace('.','')
    * def cartSubtotalNumber = karate.eval('parseInt(cartSubtotal)')

    # Step 5: Click on "Clear Shopping Cart"
    * delay(2000)
    * scroll(cartPage.clearCart).click()
    * delay(2000)
    #Verify step 5
    * match driver.dialogText == 'Are you sure?'

    # Step 6: Click OK
    * dialog(true)
    # Verify step 6
    * match text(cartPage.emptyCartText) == 'YOUR SHOPPING CART IS EMPTY'
