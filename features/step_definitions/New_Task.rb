# only fill specific scripts that are for New Tasks

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

When(/^I assign task to "(.*?)"$/) do |arg1|
	#Code for the Lookup screen
	find(:xpath, ".//*[@id='whobtn']/img").click

	#Get the main window handle
	main = page.driver.browser.window_handles.first

	#Get the popup window handle
	popup = page.driver.browser.window_handles.last

	#Then switch control between the windows
	page.driver.browser.switch_to.window(popup) do

		page.driver.browser.switch_to.frame 'searchFrame'
		puts "In the child window"  
		fill_in('lksrch', :with => arg1)
		click_on(' Go! ')
		page.driver.browser.switch_to.default_content
		page.driver.browser.switch_to.frame 'resultsFrame'
		click_link(arg1)
	end #end for Child Frame

	#page.save_screenshot 'childwindow.png'

	page.driver.browser.switch_to.window(main)

	#End of Lookup code.
end

Then(/^I should see the task assignment "(.*?)" in the page$/) do |arg1|
	tag = tagMaker('RelatedActivityList','/')
	# use xpath to identify the relatedActivityList - in the contact page
	within(:xpath, tag) do
		page.should have_content(arg1)
	end
end