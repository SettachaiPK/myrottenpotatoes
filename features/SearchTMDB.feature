Feature: User can add movie form tmdb

Scenario: SearchTMDB
  Given I am on the RottenPotatoes home page
  Then I should see "Search TMDb for a movie"
  When I fill in "search_terms" with "Men In Black"
  And I press "Search TMDb"
  Then I should be on the search tmdb page