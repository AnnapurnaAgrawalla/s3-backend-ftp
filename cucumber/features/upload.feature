Feature: upload

Scenario: 
	When I want to "upload" a file
	Then I should enter "put" command and the "filename.extension"
    Then the file should get uploaded.

Scenario: 
    When I want to "upload" a file through "TLS"
    Then I should use "em-ftpd-modified" instead of regular gem.
	Then I should enter "put" command and the "filename.extension"
    Then the file should get uploaded.