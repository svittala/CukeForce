
Given(/^I am on Contacts tab title "(.*?)"$/) do |arg1|
  click_on('Contacts Tab')
end

When(/^I select contact "(.*?)"$/) do |arg1|
  click_link(arg1)
end

When(/^I click the button "(.*?)"$/) do |arg1|
	find_button(arg1).click
end


When(/^I enter the details in the page as "(.*?)", "(.*?)", "(.*?)", "(.*?)"$/) do |arg1, arg2, arg3, arg4|
	fill_in('tsk5', :with => arg1)
	fill_in('tsk4', :with => arg2)
	fill_in('tsk6', :with => arg3)
	fill_in('reminder_dt', :with => arg4)
end

When(/^I make the selections for "(.*?)", "(.*?)","(.*?)", "(.*?)","(.*?)"$/) do |arg1, arg2, arg3, arg4, arg5|
	select(arg1, :from=> "tsk3_mlktp")
	select(arg2, :from=> "tsk2_mlktp")
	select(arg3, :from=> "tsk12")
	select(arg4, :from=> "tsk13")
	select(arg5, :from=> "reminder_dt_time")
end

When(/^I click Save button$/) do
	within(:xpath, ".//*[@id='topButtonRow']") do
		find_button('Save').click
	end
end

Then(/^I should see the task assignment "(.*?)" in the page$/) do |arg1|
	tag = tagMaker('RelatedActivityList')
	# use xpath to identify the relatedActivityList - in the contact page
	within(:xpath, tag) do
		page.should have_content(arg1)
	end
end