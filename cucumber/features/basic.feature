Feature: directory operations

  As a user after connected to server
  User wants to make some operations on files and directories
  So that user can work on server

  Scenario: PWD, print working directory
    Given Client has connected to server
    When Client send cmd "PWD"
    Then Server should respond with 257 "/" when called from root dir

  Scenario: CH, change working directory
    Given Client has connected to server
    When Client send cmd "CH dir_name"
    Then Server should respond with 250 "command successful" when called with valid directory name

  Scenario: DIR, list directory content
    Given Client has connected to server and entered Passive Mode
    When Client send cmd "DIR"
    Then Server should respond with 150 when called in the root dir with no param

  Scenario: SIZE, get a file size
    Given Client has connected to server
    When Client send cmd "SIZE one.txt"
    Then Server should always respond with 213 when called with a valid file param

  Scenario: DELETE, delete a file
    Given Client has connected to server
    When Client send cmd "DELETE one.txt"
    Then Server should always respond with 250 when the file is deleted