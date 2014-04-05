Given(/^I am on the Contacts tab as title "(.*?)"$/) do |arg1|
click_on('Contacts Tab')
expect(page).to have_title "Contacts: Home ~ salesforce.com - Enterprise Edition"
end

When(/^I select the Username as "(.*?)"$/) do |arg1|
click_link('Washington, George')
end

When(/^I hit the Edit button$/)do
 # find(:xpath, ".//*[@id='topButtonRow']/input[3]").click
within(:xpath, ".//*[@id='topButtonRow']") do
find_button('Edit').click
end
end

When(/^I select salutation as "(.*?)"$/) do |arg1|
  select("Mr.",:from=> "name_salutationcon2")
end

When(/^I enter the title as "(.*?)"$/) do |arg1|
  fill_in('con5', :with => "Manager")
end

When(/^I click the Save button to save the changes$/) do
 # find(:xpath, ".//*[@id='topButtonRow']/input[1]").click
within(:xpath, ".//*[@id='topButtonRow']") do
find_button('Save').click
end
end

Then(/^I should see the updated contact details as "(.*?)"$/) do |arg1|
  page.should have_content('Mr. George Washington')
end