Feature: Demo Salesforce Features

Background: 
  Given I am on the Salesforce home page
  When I use the "username" as "bdd_tester@csc.com"
  And I give the "password" as "Sales@4ce"
  And I click on "Login" button
  Then I should see an active tab "Home"

@ValidateLogin
Scenario: This is the first scenario for login confirmation
  When I am on home page with title "salesforce.com - Enterprise Edition"
  Then I should see an active tab "Home"

@CreateContact
  Scenario: Creating a Contact
  Given I am on the Contacts tab with title "Contacts: Home ~ salesforce.com - Enterprise Edition"
  When I enter the First Name as "George"
  And I enter the Last Name as "Washington"
  And I enter the Account as "CSC"
  And I enter the Phone as "5714119260"
  And I enter the email as "joerge@abc123.com"
  And I click on Save button
  Then I should see the new contact with message "George Washington successfully created"

@EditContact
  Scenario: Editing a Contact
  Given I am on the Contacts tab as title "Contacts: Home ~ salesforce.com - Enterprise Edition"
  When I select the Contact "Washington, George"
  And I hit the Edit button
  And I select salutation as "Mr."
  And I enter the title as "Manager"
  And I click the Save button to save the changes
  Then I should see the updated contact details as "Mr. George Washington"


@Createtask
  Scenario: Creating New Task
  Given I am on Contacts tab title "Contacts: Home ~ salesforce.com - Enterprise Edition"
  When I select contact "Washington, George"
  And I click the button "New Task"
  And I enter the details in the page as "New Assignment", "4/5/2014", "This is the sample assignment on Salesforce automation", "4/8/2014"
  And I make the selections for "Solution", "Contact","In Progress", "High","9:30 AM"
  And I click Save button
  Then I should see the task assignment "New Assignment" in the page


@DeleteContact
  Scenario: Deleting a Contact
  Given I am on the Contacts tab title "Contacts: Home ~ salesforce.com - Enterprise Edition"
  When I select a contact "Washington, George"
  And I hit the Delete button
  And I select OK from the confirmation popup
  Then I should not see the Contact "Washington, George"