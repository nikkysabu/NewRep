@PG-24
Feature: One passing scenario, one failing scenario

@a
Scenario: This is Scenario 1
Given this step passes
And this step passes		
@b
Scenario: This is Scenario 2
Given this step fails
And this step passes
@c
Scenario: This is Scenario 3
Given this step passes
And this step passes
@d
Scenario: This is Scenario 4
Given this step passes
And this step passes
@e
Scenario: This is Scenario 5
Given this step passes
And this step passes