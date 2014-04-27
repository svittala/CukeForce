# Common Steps 
When(/^I Login as "(.*?)" with password "(.*?)"$/) do |userid, password|
  	fill_in("username", :with => userid)
  	fill_in("password", :with => password)
  	click_on "Login"
end
Then(/^I should see "(.*?)" as the logged in user$/) do |username|
  	page.should have_css("#userNavLabel", :text =>username)
end

When (/^I am not in application "(.*?)"$/) do |appname|
	page.should have_no_css("#tsidLabel", :text =>appname)
end

When (/^I select application "(.*?)"$/) do |appname|
	if page.find("#tsidLabel").has_content?(appname)
		# dont like the use of if logic here - but this avoides
		# complicating the feature file - and additional condition 
		# checking in the feature file 
		puts "Already in " + appname + " Application no need to change"
	else
		#Clicking on the "Sales" link
		find(:xpath, ".//*[@id='tsidLabel']").click
		#Get the main window handle
		main = page.driver.browser.window_handles.first
		#Get the popup window handle
		popup = page.driver.browser.window_handles.last
		#Switch the control to the popup window (Menu Item)
		page.driver.browser.switch_to.window(popup)	do
			click_link(appname, exact: true )           
		end
		#Switch the control to the main window
		page.driver.browser.switch_to.window(main)
	end 
end

Then(/^I should see an active tab "(.*?)"$/) do |tabname|
	within(:xpath, ".//*[@id='tabBar']") do
		page.should have_content (tabname)
	end
end

When(/^I am on the "(.*?)" with main title  "(.*?)"$/) do |tabname,titlename|
	click_on(tabname)
	expect(page).to have_title titlename
end

Given(/^I am on the "(.*?)" with main title "(.*?)"$/) do |tabname,titlename|
	page.save_screenshot 'screenshot.jpg' 
	click_on(tabname)
	expect(page).to have_title titlename
end

Given(/^I am on the Visualforce Tab "(.*?)" with main title "(.*?)"$/) do |tabname,titlename|
	click_on(tabname)
	page.should have_css('h2', :text => titlename)
end


When(/^I click on "(.*?)" button$/) do |buttontext|
  find_button(buttontext).click
end

When (/^I assign task to "(.*?)"$/) do |arg1|
 lookUp("Name",arg1)
end


When(/^I click the "(.?)" button on the Top Row $/)do |buttontext|
# used for any button on the TopRow of the EDIT page - it may be
# commonly used for Edit, Save or Delete 
	within(:xpath, ".//*[@id='topButtonRow']") do
		find_button(buttontext).click
	end
end

When(/^I Select listview "(.*?)" view$/) do |listviewname|
  select(listviewname, :from=> "fcf")
end

When(/^I update "(.*?)" as "(.*?)"$/) do |key,value|
  fillField(key,value)
end

When(/^I select "(.*?)" as "(.*?)"$/) do |key,value|
  selectValue(key,value)
end

When(/^I select Checkbox "(.*?)"$/) do |checkboxname|
	checkBox(checkboxname)
end

When(/^I use listview "(.*?)" view$/) do |arg1|
  select(arg1, :from=> "fcf")
end


When(/^I select OK from the confirmation popup$/) do
# used for Alert window popup confirmation 
  page.driver.browser.switch_to.alert.accept
end

When(/^I update the following:$/) do |table|
	data = table.transpose.hashes
	puts data
	data.each {|key| h1 = key 
		h1.each do |key, value| 
			puts "#{key} is #{value}"
			fillField("#{key}","#{value}") 
  	    end
	}
end

Then(/^I should see "(.*?)" in the page$/) do |contentText|
  page.should have_content(contentText)
end

Then(/^I should not see "(.*?)" in the page$/) do |contenttext|
  page.should have_no_content(contenttext)
end


