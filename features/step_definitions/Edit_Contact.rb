Given(/^I am on the Contacts tab as title "(.*?)"$/) do |arg1|
	click_on('Contacts Tab')
	expect(page).to have_title arg1
end


When(/^I select the contact "(.*?)"$/) do |arg1|
# how to address multiple matches .. use match:= first in env.rb file
	click_link(arg1)
end

When(/^I hit the Edit button$/)do
	within(:xpath, ".//*[@id='topButtonRow']") do
		find_button('Edit').click
	end
end

When(/^I select salutation as "(.*?)"$/) do |arg1|
  select(arg1,:from=> "name_salutationcon2")
end

When(/^I enter the title as "(.*?)"$/) do |arg1|
  fill_in('con5', :with => arg1)
end

When(/^I click the Save button to save the changes$/) do
	within(:xpath, ".//*[@id='topButtonRow']") do
	find_button('Save').click
end
end

Then(/^I should see the updated contact details as "(.*?)"$/) do |arg1|
  page.should have_content(arg1)
end