require 'spec_helper'

describe "invitations/edit" do
  before(:each) do
    @invitation = assign(:invitation, stub_model(Invitation,
      :project_id => 1,
      :user_id => 1,
      :msg => "MyString",
      :email => "MyString"
    ))
  end

  it "renders the edit invitation form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => invitations_path(@invitation), :method => "post" do
      assert_select "input#invitation_project_id", :name => "invitation[project_id]"
      assert_select "input#invitation_user_id", :name => "invitation[user_id]"
      assert_select "input#invitation_msg", :name => "invitation[msg]"
      assert_select "input#invitation_email", :name => "invitation[email]"
    end
  end
end
