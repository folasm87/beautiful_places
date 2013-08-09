require 'spec_helper'

describe "loc_images/index" do
  before(:each) do
    assign(:loc_images, [
      stub_model(LocImage,
        :image_location => "Image Location",
        :image_url => "Image Url"
      ),
      stub_model(LocImage,
        :image_location => "Image Location",
        :image_url => "Image Url"
      )
    ])
  end

  it "renders a list of loc_images" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Image Location".to_s, :count => 2
    assert_select "tr>td", :text => "Image Url".to_s, :count => 2
  end
end
