Feature: Additional Sample Scenarios for learing
 @tableuse 
  Scenario Outline: List views shows Bid Board as an option for Territory Manager 
    Given I am logged in as a Territory Manager
    When I navigate to <viewname1> view
    Then I should see <list1> of opportunities
    And "Bid Board" column is in the listview

  Examples:
    |viewname1|list1| 
    |Closing Next Month|list1|
    |Closing This Month|list1|
    |My Open Private Opportunities|list1|
    |New Open Opportunities this Week|list1|
    |New This Week|list1|

    Scenario: some cukes
    Given I have 48 cukes in my belly
    Then I had a good meal

@listuse
   Scenario: some scenario
   Given a set of specific users
     | name      | department  |
     | Barry     | Beer Cans   |
     | Pudey     | Silly Walks |
     | Two-Lumps | Silly Walks |

 When we count the number of people in each department
 Then we will find two people in "Silly Walks"
  But we will find one person in "Beer Cans"

@junky
  Scenario Outline: Sign Up
    Given I am on the <language> site
    And I am on the home page
    When I follow "<register>"
    And I fill in the following:
      | <fname> | John |
      | <lname> | Doe  |
    And I check "paintball"
    And I fill in the following within Emergency Contact:
      | <ename>   | Jane Doe   |
      | <enumber> | 4161111111 |
    Then I should see "John Doe"
    Examples:
      | language | register  | fname         | lname     | ename | enumber  |
      | en       | Register  | First Name    | Last Name | Name  | Number   |
      | pt       | Registrar | Primeiro Nome | Sobrenome | Nome  | Telefone |