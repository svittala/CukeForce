CukeForce
========
Cukeforce is a testing tool for BDD enthusiastis who wants to extend the use of Behaviour Driven Development to Salesforce.com. 
Here we have a set of scripts to demonstrate usage of Cucumber and Capybara for Salesforce.com BDD

Usage:
======
Make sure you have Ruby on Rails, Cucumber and Capybara Installed  -  <i> Currently only supports Ruby 1.9.3 for Windows </i>
Here is some excellent instructions on the installation Cucumber for windows <a href="http://www.agileforall.com/2011/08/getting-started-with-ruby-cucumber-and-capybara-on-windows/" > blog by Richard Lawrence </a> 
<p>
If you get SSL Certification errors see this blog on <a href="https://gist.github.com/fnichol/867550" > how to Install SSL Certification for Ruby on Rails </a>
<p>
Make sure Selenium Webdriver is installed 'gem install selenium-webdriver'

Once Cucumber is installed  download the Cukeforce into a your Cukeforce Project folder 

Next go to the features folder edit the .feature file to update your salesforce.com userid and pwd

Simply run the feature file by typing "cucumber" at the command prompt.

Support Utilities
=================
1) It is better to have ansicon.exe installed in your windows machine to see the color texte in the command shell
https://github.com/adoxa/ansicon

2) Good ruby editor like caret plugin for Chrome will help you edit the code from your browser environment
http://thomaswilburn.net/caret/






