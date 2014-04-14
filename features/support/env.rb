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
