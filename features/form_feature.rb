# encoding: utf-8
# vim: tabstop=2:softtabstop=2:shiftwidth=2:noexpandtab
Feature: Form Test
	Scenario: Select
		Given I visit form page
		When I select "option" from "list" by "text"
