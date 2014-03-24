require 'spec_helper'

describe "schools/edit" do
  before(:each) do
    @school = assign(:school, stub_model(School))
  end

  it "renders the edit school form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", school_path(@school), "post" do
    end
  end
end
