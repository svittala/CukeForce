Feature: Demo Visualforce Page Testing

Background: 
  Given I am on the Salesforce home page
  When I Login as "myuser" with password "xxxxx"
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

Scenario:
As an Under writer I should be able to assess value and risk of a building that belongs to a customer

@Step1:LocateBuildingData
Given I am at a "Customer X" building site
When I lookup the "Customer X"
Then I should be able to review the building details

@Step2:AssessBuilding
Given I am at the "Customer X" 
When I enter Building Details for "Building 1"
And I verify the following
|square footage 	| 9800|
|number of floors	| 14 |
|age 		| 12 |
|safety features	|"Special features"|
|Code Compliance	| "No Violations found"|
Then I should be able to submit the Asset Documentation
And   I should be able to initiate Supervisor Approval workflow
