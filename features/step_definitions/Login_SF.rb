Given(/^I am on the Salesforce home page$/) do
  visit 'https://login.salesforce.com/'
puts page.title
 expect(page).to have_title "salesforce.com - Customer Secure Login Page"
#page.driver.browser.manage.window.maximize
end

When(/^I enter the username as "(.*?)"$/) do |arg1|
  fill_in('username', :with => "bdd_tester@csc.com")
end

When(/^I enter the password as "(.*?)"$/) do |arg1|
  fill_in('password', :with => "Sales@4ce")
end

When(/^I click on login button$/) do
  click_on 'Login'
end

When(/^I am on home page with title "(.*?)"$/) do |arg1|
puts page.title
expect(page).to have_title "salesforce.com - Enterprise Edition"
end

Then(/^I should see an active tab "(.*?)"$/) do |arg1|
page.should have_xpath(".//*[@id='home_Tab']/a", :text => 'Home')
end