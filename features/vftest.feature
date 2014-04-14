Feature: Demo Visualforce Page Testing

Background: 
  Given I am on the Salesforce home page
  When I Login as "svittala.personal@hotmail.com" with password "Sales@4ce"
  Then I should see an active tab "Home"

@ValidateLogin
Scenario: login confirmation
  When I am on home page with title "salesforce.com - Developer Edition"
  Then I should see an active tab "Home"

@CreateCalendarBlank
  Scenario: Creating a Contact
  Given I am on the Visualforce Tab "Create Calendar Tab" with main title "Create Calendar"
  When I click on "Create Calendar" button
  Then I should see "Errors" in the page

  @CreateCalendar
  Scenario: Creating a Contact
  Given I am on the Visualforce Tab "Create Calendar Tab" with main title "Create Calendar"
  When I update the following:
      |Summary: |  Testing Calendar |
      |Location: | Fill field |
      |description: | Testing if vf can do this |
  And I click on "Create Calendar" button
  Then I should see "AUTHENTICATION ERROR. Please authenticate" in the page