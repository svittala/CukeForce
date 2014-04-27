require 'capybara/cucumber'
require 'RSpec'
Capybara.default_driver = :selenium
Capybara.match =:first	
Capybara.app_host ="https://login.salesforce.com"


def tagMaker (sectiontitle,seperator)
# make an xpath tag using the SFDC ID from the URL
# example of a witing is 
# within(:xpath, ".//*[@id='003G000001dEXNV_RelatedActivityList']/div[1]/div") do
# we need to make the path search strin from url and section titme argument
	searchtag = current_url
	searchtag = searchtag.split(seperator).last
	searchtag = ".//*[@id=\'" +searchtag + '_' + sectiontitle + "\']"
	puts searchtag
	return searchtag
end

# Following method will read the Label and fill in the respective field with the given data
def fillField (fieldname,value)
@thefield = all("label").detect { |l| (l.text =~ /#{fieldname}/i).nil? == false }
if @thefield.nil? then
    raise Exception.new("Couldn't find field #{fieldname}")
  end
fill_in @thefield[:for], :with=>value
 
end
 
# Following method will read the Label and selects the value from the dropdown list
def selectValue (fieldname,value)
@thefield = all("label").detect { |l| (l.text =~ /#{fieldname}/i).nil? == false }
if @thefield.nil? then
    raise Exception.new("Couldn't find field #{fieldname}")
  end
select(value,:from=> @thefield[:for])
end
 
 
# Following method will read the Label and checks the respective checkbox
def checkBox(fieldname)
@thefield = all("label").detect { |l| (l.text =~ /#{fieldname}/i).nil? == false }
if @thefield.nil? then
    raise Exception.new("Couldn't find field #{fieldname}")
  end
check(@thefield[:for])
end
 
 # spec/support/wait_for_ajax.rb
module WaitForAjax
  def wait_for_ajax
    Timeout.timeout(Capybara.default_wait_time) do
      loop until finished_all_ajax_requests?
    end
  end

  def finished_all_ajax_requests?
    page.evaluate_script('jQuery.active').zero?
  end
end

RSpec.configure do |config|
  config.include WaitForAjax, type: :feature
end


#Following method will look up for a Contact/Opportunity
# It is taking two parameters: As of now, I observed two types of buttons (Whobtn, Whtbtn). One to lookup the related Opportunities, Products, other one is related to the Contacts. If we get more button types from other places, then simply we can expand the below "Switch/Case" to accommodate them.
# It will click on the lookup icon, gives the search text and finally clicks on the link
#In the step definition, you can call the above definition as below:
#lookUp("Name","Abraham Lincon") # This will click on the "Name" Lookup, search for the user and finally clicks the link from the search results.
#lookUp("Related To","AppLogic") # This will click on the "Related To" Lookup, search for the related stuff and finally clicks that link from the search results.
 
def lookUp(btntype,name)
# Switch/Case to identify the button type
  case btntype
    when "Related To"
      btype = "whtbtn"
    when "Name"
      btype = "whobtn"
    else
      puts "Failed to do the lookp up"
  end
   
  #Xpath based on the button type
  find(:xpath, ".//*[@id='"+btype+"']/img").click
   
  #Get the main window handle
  main = page.driver.browser.window_handles.first
   
  #Get the popup window handle
  popup = page.driver.browser.window_handles.last
 
  #Then switch control between the windows
  page.driver.browser.switch_to.window(popup) do
    page.driver.browser.switch_to.frame 'searchFrame'
    fill_in('lksrch', :with => name) # Giving the name to search
    click_on(' Go! ')
   
    page.driver.browser.switch_to.default_content
    page.has_title? "Search ~ salesforce.com - Enterprise Edition"
    page.driver.browser.switch_to.frame 'resultsFrame'

    click_link(name) # Clicking on the link from the search results.
  end #end for Child Frame
   
  page.driver.browser.switch_to.window(main)
end # end of look up def
 
 