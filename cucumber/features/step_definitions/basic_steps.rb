Given(/^Client has connected to server$/) do
end

When(/^Client send cmd "(.*?)"$/) do |arg1|
end

Then(/^Server should respond with (\d+) "(.*?)" when called from root dir$/) do |arg1, arg2|
end

Then(/^Server should respond with (\d+) "(.*?)" when called with valid directory name$/) do |arg1, arg2|
end

Given(/^Client has connected to server and entered Passive Mode$/) do
end

Then(/^Server should respond with (\d+) when called in the root dir with no param$/) do |arg1|
end

Then(/^Server should always respond with (\d+) when called with a valid file param$/) do |arg1|
end

Then(/^Server should always respond with (\d+) when the file is deleted$/) do |arg1|
end