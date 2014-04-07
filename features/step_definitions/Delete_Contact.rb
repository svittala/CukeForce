Given(/^I am on the Contacts tab title "(.*?)"$/) do |arg1|
click_on('Contacts Tab')
expect(page).to have_title "Contacts: Home ~ salesforce.com - Enterprise Edition"
end


When(/^I select a contact "(.*?)"$/) do |arg1|
click_link(arg1)
end

When(/^I hit the Delete button$/)do
	within(:xpath, ".//*[@id='topButtonRow']") do
		find_button('Delete').click
	end
end

When(/^I select OK from the confirmation popup$/) do
  page.driver.browser.switch_to.alert.accept
end

Then(/^I should not see the Contact "(.*?)"$/) do |arg1|
  page.should have_no_content(arg1)
end