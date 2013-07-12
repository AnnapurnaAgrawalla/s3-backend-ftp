Feature: download

Scenario: 
	When I want to "download" a file
	Then I should enter "get" command and the "filename.extension"
    Then I should get the downloaded file

Scenario: 
    When I want to "download" a file through "TLS"
    Then I should use "em-ftpd-modified" instead of regular gem.
	Then I should enter "get" command and the "filename.extension"
    Then the file should get downloaded.
