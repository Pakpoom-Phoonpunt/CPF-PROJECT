Feature: Worker Features
    As an Worker 
    I want to see my shift time​
    So that  I can work on time
    And I want to see my profile​
    So that I can know the information about my job

    Scenario: Able to Get their Shift Time
        Given I am on the profile page
        Then I should see  "shift time plan" 
        And I should see "information"
        And I should see "overtime" 