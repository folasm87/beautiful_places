require 'spec_helper'

describe "loc_images/edit" do
  before(:each) do
    @loc_image = assign(:loc_image, stub_model(LocImage,
      :image_location => "MyString",
      :image_url => "MyString"
    ))
  end

  it "renders the edit loc_image form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", loc_image_path(@loc_image), "post" do
      assert_select "input#loc_image_image_location[name=?]", "loc_image[image_location]"
      assert_select "input#loc_image_image_url[name=?]", "loc_image[image_url]"
    end
  end
end
