Feature: download

Scenario: 
	When I want to "download" a file
	Then I should enter "get" command and the "filename.extension"
    Then I should get the downloaded file
