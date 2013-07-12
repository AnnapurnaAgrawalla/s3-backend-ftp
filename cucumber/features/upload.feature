Feature: upload

Scenario: 
	When I want to "upload" a file
	Then I should enter "put" command and the "filename.extension"
    Then the file should get uploaded.