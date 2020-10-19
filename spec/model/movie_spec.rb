require 'rails_helper'

RSpec.describe Movie, type: :model do
    let (:subject) {Movie.new}
    describe "#Test rating" do
      it "should be true when subject is object and rating of subject is 5" do
        subject.Test_rating
        expect(subject.rating).to eq("5")
      end
    end
  end