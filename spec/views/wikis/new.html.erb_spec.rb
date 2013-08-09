require 'spec_helper'

describe "wikis/new" do
  before(:each) do
    assign(:wiki, stub_model(Wiki,
      :article_location => "MyString",
      :article_url => "MyString"
    ).as_new_record)
  end

  it "renders new wiki form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", wikis_path, "post" do
      assert_select "input#wiki_article_location[name=?]", "wiki[article_location]"
      assert_select "input#wiki_article_url[name=?]", "wiki[article_url]"
    end
  end
end
