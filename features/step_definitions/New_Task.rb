
Given(/^I am on Contacts tab title "(.*?)"$/) do |arg1|
  click_on('Contacts Tab')
end

When(/^I select Username "(.*?)"$/) do |arg1|
  click_link('Washington, George')
end

When(/^I click the button "(.*?)"$/) do |arg1|
	find_button('New Task').click
end

When(/^I enter the details in the page as "(.*?)", "(.*?)", "(.*?)", "(.*?)", "(.*?)", "(.*?)", "(.*?)", "(.*?)", "(.*?)", "(.*?)"$/) do |arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10|
	fill_in('tsk5', :with => "New Assignment on SalesForce")
	fill_in('tsk4', :with => "4/6/2014")
	select("Solution",:from=> "tsk3_mlktp")
	select("Contact",:from=> "tsk2_mlktp")
	fill_in('tsk6', :with => "This is the sample assignment on Salesforce automation")
	select("In Progress",:from=> "tsk12")
	select("High",:from=> "tsk13")
	fill_in('reminder_dt', :with => "4/8/2014")
	select("9:30 AM",:from=> "reminder_dt_time")
end


When(/^I click Save button$/) do
	within(:xpath, ".//*[@id='topButtonRow']") do
	find_button('Save').click
end

page.save_screenshot 'screenshot.png'
puts current_url
puts uriSplitter (current_url)


end

Then(/^I should see the respective assignment in the page$/) do
#	within (:xpath, '//*[@id')
	tag = tagMaker('RelatedActivityList')
	within(:xpath, tag) do
		page.should have_content('New Assignment on SalesForce')
	end

end