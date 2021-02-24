@a
Feature: Execution using curl command

	@b
	Scenario: Passing
		Given this step passes
		
		  @c
		  Scenario: Failing
		    Given this step fails
		    
		  @d
		  Scenario: Passing
		    Given this step passes
		    
		  @e
		  Scenario: Failing
		    Given this step fails
