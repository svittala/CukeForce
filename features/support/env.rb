require 'capybara/cucumber'
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

