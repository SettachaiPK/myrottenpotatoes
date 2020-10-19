Feature: User can press cancel when want to undo from create page

Scenario: check cancel
  Given I am on the RottenPotatoes home page
  When I follow "Add new movie"
  Then I should be on the Create New Movie page
  When I follow "Cancel"
  Then I should be on the RottenPotatoes home page