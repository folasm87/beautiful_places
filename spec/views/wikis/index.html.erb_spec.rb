require 'spec_helper'

describe "wikis/index" do
  before(:each) do
    assign(:wikis, [
      stub_model(Wiki,
        :article_location => "Article Location",
        :article_url => "Article Url"
      ),
      stub_model(Wiki,
        :article_location => "Article Location",
        :article_url => "Article Url"
      )
    ])
  end

  it "renders a list of wikis" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Article Location".to_s, :count => 2
    assert_select "tr>td", :text => "Article Url".to_s, :count => 2
  end
end
