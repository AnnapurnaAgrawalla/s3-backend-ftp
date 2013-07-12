When(/^I want to "(.*?)" a file$/) do |arg1|
  arg1 = "get"
end

Then(/^I should enter "(.*?)" command and the "(.*?)"$/) do |arg1, arg2|
 arg1 = "get"
 arg2 = "filename.extension"
end

Then(/^I should get the downloaded file/) do 
end

Then(/^the file should get downloaded\.$/) do
end