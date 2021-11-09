Feature: Dashboard 
    As an Manager 
    I want to select department​
    so that I can manage people on the department​
    And I want to select shift time
    so that I can manage selected shift
    And I want to see people working on the selected shift​
    so that I know how many men working at a moment time
    And I want to see people who planned to work on the selected shift​
    so that I know how many workers planned to work on the shift.

    Scenario: current shift on department
        Given I am on the dashboard page
        When I press "selected department"
        Then I should see "worker list of current working shift"

    Scenario: select shift
        Given I am on the dashboard page
        When I press "shift select"
        Then I should see "shift list"
        And I press "select shift"
        Then I should see "worker list of that shift"

    Scenario: select actual
        Given I am on the dashboard page
        When I press "actual"
        Then I should see "actual worker list"

    Scenario: plan actual
       Given I am on the dashboard page
       When I press "plan"
       And I select "Date"
       Then I should see "planned worker list"