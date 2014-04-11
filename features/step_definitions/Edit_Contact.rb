# all steps for Contact Edits and Deletes

Given(/^I am on Contacts tab title "(.*?)"$/) do |arg1|
	click_on('Contacts Tab')
	expect(page).to have_title arg1
end

When(/^I select the Contact "(.*?)"$/) do |arg1|
# how to address multiple matches .. use match:= first in env.rb file
	#click_link(arg1)
	#find(arg1).click
	find("a", :text => arg1).click
end
