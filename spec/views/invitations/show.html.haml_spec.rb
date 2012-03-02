require 'spec_helper'

describe "invitations/show" do
  before(:each) do
    @invitation = assign(:invitation, stub_model(Invitation,
      :project_id => 1,
      :user_id => 1,
      :msg => "Msg",
      :email => "Email"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Msg/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Email/)
  end
end
