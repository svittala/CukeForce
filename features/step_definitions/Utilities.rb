# Common Steps 
When(/^I Login as "(.*?)" with password "(.*?)"$/) do |arg1, arg2|
  	fill_in("username", :with => arg1)
  	fill_in("password", :with => arg2)
  	click_on "Login"
end


When(/^I click on "(.*?)" button$/) do |arg1|
  click_on arg1
end


When(/^I click the "(.?)" button on the Top Row $/)do |arg1|
# used for any button on the TopRow of the EDIT page - it may be
# commonly used for Edit, Save or Delete 
	within(:xpath, ".//*[@id='topButtonRow']") do
		find_button(arg1).click
	end
end

When(/^I Select listview "(.*?)" view$/) do |arg1|
  select(arg1, :from=> "fcf")
end

When(/^I select "(.*?)" as "(.*?)"$/) do |arg1,arg2|
  selectValue(arg1,arg2)
end

When(/^I select Checkbox "(.*?)"$/) do |arg1|
	checkBox(arg1)
end

When(/^I select OK from the confirmation popup$/) do
# used for Alert window popup confirmation 
  page.driver.browser.switch_to.alert.accept
end

When(/^I use listview "(.*?)" view$/) do |arg1|
  select(arg1, :from=> "fcf")
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

Then(/^I should see "(.*?)" in the page$/) do |arg1|
  page.should have_content(arg1)
end

Then(/^I should not see "(.*?)" in the page$/) do |arg1|
  page.should have_no_content(arg1)
end


