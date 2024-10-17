Feature: Verify puchasing by a Guest
  Background:
    * startConfig('chrome_local')
    * def appData = data('tademostoreweb', 'app')
    * def computerAndOfficePage = locator('tademostoreweb', 'computerandofficepage')
    * def aboutUsPage = locator('tademostoreweb', 'aboutuspage')
    * def basePage = locator('tademostoreweb', 'basepage')
    * def cartPage = locator('tademostoreweb', 'cartpage')
    * def shopPage = locator('tademostoreweb', 'shoppage')
    * def checkoutPage = locator('tademostoreweb', 'checkoutpage')
    * def orderPage = locator('tademostoreweb', 'orderpage')
    * def popup = locator('tademostoreweb', 'popup')

  Scenario: Verify puchasing by a Guest
    # Step 1: Navigate to app
    * driver appData.url

    # Step 2: Click on Cart icon in the top right of shopping page
    * mouse().move(basePage.cartIcon).click()
    # Verify step 2
    * match text(cartPage.emptyText) == 'YOUR SHOPPING CART IS EMPTY'

    # Step3: Click on "Return to Shop" button
    * mouse().move(basePage.noticeOKButton).click()
    * delay(1000)
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

    * def product = 'AirPods'

    * def shopProductName = format(shopPage.productName, product)
    * scroll(shopProductName)
    * def shopName = text(shopProductName)

    * def shopProductPrice = format(shopPage.productPrice, product)
    * def shopPrice = text(shopProductPrice).replace('$', '').replace('.','')
    * def shopPriceNumber = karate.eval('parseInt(shopPrice)')

    # Step5: Click on Cart icon in the top right of shopping page
    * scroll(basePage.cartButton).click()

    # Verify the Texts are displayed correctly
    * match attribute(cartPage.shoppingCartText, 'class') contains 'active'
    * match attribute(cartPage.checkoutText, 'class') !contains 'active'
    * match attribute(cartPage.orderStatusText, 'class') !contains 'active'

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

    # Verify corrected item
    * match cartName == shopName
    * match cartPrice == shopPrice
    * match cartSubtotalNumber == cartPriceNumber * cartQuantityNumber

    # Step6: Click on "Process to checkout" button
    * mouse().move(cartPage.proceedToCheckoutBtn).click()
    * delay(2000)
    # Verify step 6
    * match attribute(cartPage.shoppingCartText, 'class') contains 'active'
    * match attribute(cartPage.checkoutText, 'class') contains 'active'
    * match attribute(cartPage.orderStatusText, 'class') !contains 'active'

    # Step 7: Enter required fields  then click on "Place Order" button
    * delay(1000)
    * scroll(checkoutPage.firstNameTextbox)
    * input(checkoutPage.firstNameTextbox, 'Anh')

    * scroll(checkoutPage.lastNameTextbox)
    * input(checkoutPage.lastNameTextbox, 'Tran')

    * scroll(checkoutPage.streetTextbox)
    * input(checkoutPage.streetTextbox, 'DienBienPhu')

    * scroll(checkoutPage.cityTextbox)
    * input(checkoutPage.cityTextbox, 'Danang')

    * scroll(checkoutPage.postcodeTextbox)
    * input(checkoutPage.postcodeTextbox, '50000')

    * scroll(checkoutPage.phoneTextbox)
    * input(checkoutPage.phoneTextbox, '123456789')

    * scroll(checkoutPage.emailTextbox)
    * input(checkoutPage.emailTextbox, 'your.name.yyyymmdd@mailinator.com')

    * def paymentRadioButton = format(checkoutPage.paymentRadio, 'Cash on delivery')
    * scroll(paymentRadioButton).click()

    * scroll(cartPage.placeOrderButton).click()
    * delay(2000)

    # Verify step 7
    * match text(orderPage.thankyouText) == 'Thank you. Your order has been received.'
