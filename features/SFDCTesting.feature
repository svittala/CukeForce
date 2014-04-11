Feature: Demo Salesforce Features

Background: 
  Given I am on the Salesforce home page
  When I Login as "bdd_tester@csc.com" with password "Sales@4ce"
  Then I should see an active tab "Home"

@ValidateLogin
Scenario: login confirmation
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
  And I click on "Save" button
  Then I should see "George Washington successfully created" in the page


@EditContact
  Scenario: Editing a Contact
  Given I am on Contacts tab title "Contacts: Home ~ salesforce.com - Enterprise Edition"
  When I use listview "New This Week" view
  And I select the Contact "Washington, George"
  And I click on "Edit" button
  And I update the following:
      |Phone |  7034655777 |
      |Title | Manager|
      |moBile | 2249993077 |
      |Mailing Street | 8119, Heatherton Lane|
      |Mailing City | Vienna|
      |Mailing CoUNTry |Fairfax|
      |Other street|Presscott Dr|
      |Other Zip/Postal Code|22180| 
      |other city|Dunnlorring|
  And I select "Lead Source" as "Partner"
  And I select Checkbox "Partner Converted?"
  And I click on "Save" button
  Then I should see "Mr. George Washington" in the page


@CreateTask
  Scenario: Creating New Task
  Given I am on Contacts tab title "Contacts: Home ~ salesforce.com - Enterprise Edition"
  When I use listview "New This Week" view
  And I select the Contact "Washington, George"
  And I click on "New Task" button
  And I enter the details in the page as "New Assignment", "4/5/2014", "This is the sample assignment on Salesforce automation", "4/8/2014"
  And I make the selections for "Solution", "Contact","In Progress", "High","9:30 AM"
  And I assign task to "Abraham Lincon"
  And I click on "Save" button
  Then I should see "New Assignment" in the page


@DeleteContact
  Scenario: Deleting a Contact
  Given I am on Contacts tab title "Contacts: Home ~ salesforce.com - Enterprise Edition"
  When I use listview "New This Week" view
  And I select the Contact "Washington, George"
  And I click on "Delete" button
  And I select OK from the confirmation popup
  Then I should not see "Washington, George" in the page


  # opportunity management views
  @OM2
  Scenario Outline: Opportunity Management List views shows "Stage" value
  Given I am on the Opportunities tab with title "Opportunities: Home ~ salesforce.com - Enterprise Edition"
  When I use listview "<viewName>" view
  Then I should see list of opportunities
    
  Examples:
    |viewName| 
    |Closing Next Month|
    |Closing This Month|
    |My Opportunities|
    |All Opportunities|
    |New This Week|
    |Won| 