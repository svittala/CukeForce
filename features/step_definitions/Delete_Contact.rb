Given(/^I am on the Contacts tab title "(.*?)"$/) do |arg1|
click_on('Contacts Tab')
expect(page).to have_title "Contacts: Home ~ salesforce.com - Enterprise Edition"
end

When(/^I select the Username "(.*?)"$/) do |arg1|
click_link('Washington, George')
end

When(/^I hit the Delete button$/)do
 #find(:xpath, ".//*[@id='topButtonRow']/input[4]").click
within(:xpath, ".//*[@id='topButtonRow']") do
find_button('Delete').click
end
end

When(/^I select OK from the confirmation popup$/) do
  page.driver.browser.switch_to.alert.accept
end

Then(/^I should not see the respective contact in the page$/) do
  page.should have_no_content('Washington, George')
end