require 'spec_helper'

describe "wikis/edit" do
  before(:each) do
    @wiki = assign(:wiki, stub_model(Wiki,
      :article_location => "MyString",
      :article_url => "MyString"
    ))
  end

  it "renders the edit wiki form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", wiki_path(@wiki), "post" do
      assert_select "input#wiki_article_location[name=?]", "wiki[article_location]"
      assert_select "input#wiki_article_url[name=?]", "wiki[article_url]"
    end
  end
end
