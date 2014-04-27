Given(/^I am on the Salesforce home page$/) do
 visit '/'
 puts page.title
 expect(page).to have_title "salesforce.com - Customer Secure Login Page"
 # if you want to maximize page use the following line
 #page.driver.browser.manage.window.maximize
end

When(/^I am on home page with title "(.*?)"$/) do |arg1|
puts page.title
expect(page).to have_title arg1
end

