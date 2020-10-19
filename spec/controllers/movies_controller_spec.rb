require 'rails_helper'
require 'date'

describe MoviesController do
  include RSpec::Rails::ControllerExampleGroup
  describe 'check rotues of search_tmdb' do
    it 'calls the model method that performs TMDB search' do
      expect(:post => "/movies/search_tmdb").to (
        route_to("movies#search_tmdb")
      )
    end
  end

  describe 'seaching TMDB' do
    it 'calls the model method that performs TMDB search' do
      route_to("movies#search_tmdb", :search_terms => "hardware")
    end
  end
end

RSpec.describe Movie, type: :model do
  let (:subject) {Movie.new}
  describe "#Test title" do
    it "should be true when subject is object and title of subject is Test subject" do
      subject.Test_title
      expect(subject.title).to eq('Test title')
    end
  end
end