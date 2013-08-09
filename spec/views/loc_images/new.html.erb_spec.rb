require 'spec_helper'

describe "loc_images/new" do
  before(:each) do
    assign(:loc_image, stub_model(LocImage,
      :image_location => "MyString",
      :image_url => "MyString"
    ).as_new_record)
  end

  it "renders new loc_image form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", loc_images_path, "post" do
      assert_select "input#loc_image_image_location[name=?]", "loc_image[image_location]"
      assert_select "input#loc_image_image_url[name=?]", "loc_image[image_url]"
    end
  end
end
