require 'spec_helper'

describe "wikis/show" do
  before(:each) do
    @wiki = assign(:wiki, stub_model(Wiki,
      :article_location => "Article Location",
      :article_url => "Article Url"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Article Location/)
    rendered.should match(/Article Url/)
  end
end
