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
    * def myaccountPage = locator('tademostoreweb', 'myaccountpage')
    * def mailbasePage = locator('tademostoreweb', 'mailbasepage')
    * def publicmessagePage = locator('tademostoreweb', 'publicmessagepage')

  Scenario: Verify creating and activating an account
    # Step 1: Navigate to app
    * driver appData.url

    # Step 2: Click Log in / Sign up in the top page
    * mouse().move(basePage.loginLink).click()

    # Step 3: Enter email in Register email textbox
    * delay(1000)
    * mouse().move(basePage.noticeOKButton).click()
    * delay(1000)
    * input(myaccountPage.registerEmailTextbox, 'your.name.yyyymmdd@mailinator.com')

    # Step 4: Close Shopping page window
    * quit()
    * delay(1000)

    # Step 5: Go to mail server page
    * driver appData.mailServe
    * maximize()
    * delay(1000)

    # Step 6: Click on "Public Inbox" on the top right of mail server page
    * mouse().move(mailbasePage.publicInboxLink).click()

    # Step 7: Enter email at step 3 to textbox at the top right of the "Public Messages" page
    * input(publicmessagePage.mailTextbox, 'your.name.yyyymmdd@mailinator.com')

    # Step 8: Click on email with subject contained "Sample Website account has been created!"
