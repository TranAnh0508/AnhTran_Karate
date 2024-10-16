Feature: Get Cart Count
  Background:
    * def basePage = locator('tademostoreweb', 'basepage')

  Scenario: Get Cart Count
    * print 'Cart Count:'
    * def cartCount = karate.get(basePage.cartCount).value()
    * print cartCount
