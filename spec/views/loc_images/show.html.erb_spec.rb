require 'spec_helper'

describe "loc_images/show" do
  before(:each) do
    @loc_image = assign(:loc_image, stub_model(LocImage,
      :image_location => "Image Location",
      :image_url => "Image Url"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Image Location/)
    rendered.should match(/Image Url/)
  end
end
