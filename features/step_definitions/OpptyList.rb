Given(/^I am on the Opportunities tab with title "(.*?)"$/) do |arg1|
  click_on('Opportunities Tab')
  expect(page).to have_title arg1
end

When(/^I use listview "(.*?)" view$/) do |arg1|
  select(arg1, :from=> "fcf")
end


Then(/^I should see list of opportunities$/) do
	 tag = tagMaker('listBody',"=")
	 within(:xpath, tag) do
		 page.should have_content("Opportunity Name")
	 end
end