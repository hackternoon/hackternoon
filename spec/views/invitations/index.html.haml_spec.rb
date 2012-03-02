require 'spec_helper'

describe "invitations/index" do
  before(:each) do
    assign(:invitations, [
      stub_model(Invitation,
        :project_id => 1,
        :user_id => 1,
        :msg => "Msg"
      ),
      stub_model(Invitation,
        :project_id => 1,
        :user_id => 1,
        :msg => "Msg"
      )
    ])
  end

  it "renders a list of invitations" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Msg".to_s, :count => 2
  end
end
