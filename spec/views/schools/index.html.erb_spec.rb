require 'spec_helper'

describe "schools/index" do
  before(:each) do
    assign(:schools, [
      stub_model(School),
      stub_model(School)
    ])
  end

  it "renders a list of schools" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
