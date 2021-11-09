Feature: Manage shift
    I want to add man to man list of shifts ​
    so that I can add man list each shift ​
    I want to delete user from list of shifts ​
    so that I can edit man list each shift 
    ​And I want to search worker by name​
    so that I can found worker easier
    ​And I want to edit worker’s overtime ​
    so that I can manage shift time of worker

    Scenario: Add worker list on each shift
        Given I am on the manage shift page
        When I select "worker name" 
        And I press "add" 
        Then I should see "selected worker" on different list
        When I press "Save" 
        Then I should see "This shift was saved"

    Scenario: Delete worker list on each shift
        Given I am on the manage shift page
        When I select "worker name" 
        And I press "delete"      
        Then I should not see "selected worker" 
    
    Scenario: Search Worker
        Given I am on the manage shift page
        When I fill "worker name" with "john"
        And I press "search"      
        Then I should see "john" 
        
    Scenario: Add OT time
        Given I am on the manage shift page
        When I select "worker name" 
        And I fill "Assign time" with "number"
        And I press "Assign"      
        Then I should see "number" 