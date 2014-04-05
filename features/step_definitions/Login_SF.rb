Given(/^I am on the Salesforce home page$/) do
 visit '/'
 puts page.title
 expect(page).to have_title "salesforce.com - Customer Secure Login Page"
 # if you want to maximize page use the following line
 #page.driver.browser.manage.window.maximize
end

When(/^I use the "(.*?)" as "(.*?)"$/) do |arg1, arg2|
  	fill_in(arg1, :with => arg2)
end

When(/^I give the "(.*?)" as "(.*?)"$/) do |arg1, arg2|
	fill_in(arg1, :with => arg2)
end
When(/^I click on "(.*?)" button$/) do |arg1|
  click_on arg1
end

When(/^I am on home page with title "(.*?)"$/) do |arg1|
puts page.title
expect(page).to have_title "salesforce.com - Enterprise Edition"
end

Then(/^I should see an active tab "(.*?)"$/) do |arg1|
page.should have_xpath(".//*[@id='home_Tab']/a", :text => 'Home')
end