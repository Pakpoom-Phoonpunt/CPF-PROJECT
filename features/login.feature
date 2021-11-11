Feature: Login Account 
    As an User 
    I want to login my Account 
    So that I can authentication

    Scenario: When "worker" log in 
        Given I am on the login page
        When I fill in "username" with "1"
        And I fill in "password" with "1"
        And I press "Log In"
        Then I should see "Something wrong"
        And I should be on the profile page

    Scenario: Login As a Manager
        Given I am on the login page
        When I fill in "managername" with "b"
        And I fill in "password" with "123"
        Then I should be on the dashboard page

    Scenario: Login As a Admin
        Given I am on the login page
        When I fill in "adminname" with "c"
        And I fill in "password" with "123"
        Then I should be on the admin page

