require "spec_helper"

describe LocImagesController do
  describe "routing" do

    it "routes to #index" do
      get("/loc_images").should route_to("loc_images#index")
    end

    it "routes to #new" do
      get("/loc_images/new").should route_to("loc_images#new")
    end

    it "routes to #show" do
      get("/loc_images/1").should route_to("loc_images#show", :id => "1")
    end

    it "routes to #edit" do
      get("/loc_images/1/edit").should route_to("loc_images#edit", :id => "1")
    end

    it "routes to #create" do
      post("/loc_images").should route_to("loc_images#create")
    end

    it "routes to #update" do
      put("/loc_images/1").should route_to("loc_images#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/loc_images/1").should route_to("loc_images#destroy", :id => "1")
    end

  end
end
