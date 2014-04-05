require 'capybara/cucumber'
Capybara.default_driver = :selenium
Capybara.match =:first	
Capybara.app_host ="https://login.salesforce.com"
def uriSplitter (arg1)
# returns the last element of the url - ususlly SFDC ID
	require 'uri'
	u = URI.parse(arg1)
	u= u.path.split('/').last
	return u
end

def tagMaker (sectiontitle)
# make an xpath tag using the SFDC ID from the URL
# example of a witing is 
# within(:xpath, ".//*[@id='003G000001dEXNV_RelatedActivityList']/div[1]/div") do
# we need to make the path search strin from url and section titme argument
	require 'uri'
	searchtag = URI.parse(current_url).path.split('/').last
	searchtag = ".//*[@id=\'" +searchtag + '_' + sectiontitle + "\']/div[1]/div"
	puts searchtag
	return searchtag
end
