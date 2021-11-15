Feature: Login Account 
    As an User 
    I want to login my Account 
    So that I can authentication

  


    Scenario: Login As a Admin
        Given I am on the login page
        When I fill in "adminname" with "c"
        And I fill in "password" with "123"
        Then I should be on the admin page

