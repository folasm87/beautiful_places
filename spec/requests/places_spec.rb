require 'spec_helper'

describe "Places" do
  
=begin
  describe "GET /places" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get places_index_path
      response.status.should be(200)
    end
  end
=end
  describe "Home page" do

    it "should have the content 'Beautiful Places'" do
      visit '/places/index'
      expect(page).to have_content('Beautiful Places')
    end
  end
end
