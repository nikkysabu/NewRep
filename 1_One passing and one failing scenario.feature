@T1-10
Feature: One passing and one failing scenario

	@TEST_T1-9
	Scenario: One passing and one failing scenario
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
