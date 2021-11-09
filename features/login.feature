Feature: Login Account 
    As an User 
    I want to login my Account 
    So that I can authentication

    Scenario: Login As a Worker
        Given I am on the login page
        When I fill "workername" with "a"
        And I fill "password" with "123"
        Then I should be on the profile page

    Scenario: Login As a Manager
        Given I am on the login page
        When I fill "managername" with "b"
        And I fill "password" with "123"
        Then I should be on the dashboard page

    Scenario: Login As a Admin
        Given I am on the login page
        When I fill "adminname" with "c"
        And I fill "password" with "123"
        Then I should be on the admin page

