Given(/^I am on the Contacts tab with title "(.*?)"$/) do |arg1|
click_on('Contacts Tab')
expect(page).to have_title "Contacts: Home ~ salesforce.com - Enterprise Edition"
end

When(/^I enter the First Name as "(.*?)"$/) do |arg1|
fill_in('name_first', :with => "George")
end

When(/^I enter the Last Name as "(.*?)"$/) do |arg1|
  fill_in('name_last', :with => "Washington")
end

When(/^I enter the Account as "(.*?)"$/) do |arg1|
  fill_in('account', :with => "CSC")
end

When(/^I enter the Phone as "(.*?)"$/) do |arg1|
  fill_in('phone1', :with => "CSC")
end

When(/^I enter the email as "(.*?)"$/) do |arg1|
  fill_in('email', :with => "joerge@abc123.com")
end

When(/^I click on Save button$/) do
  click_on 'Save'
end

Then(/^I should see the new contact with message "(.*?)"$/) do |arg1|
  page.should have_content('George Washington successfully created')
page.should have_content('Washington, George')
end