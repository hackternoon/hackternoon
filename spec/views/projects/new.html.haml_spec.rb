require 'spec_helper'

describe "projects/new.html.haml" do
  before(:each) do
    assign(:project, stub_model(Project,
      :name => "MyString",
      :dscrptn => "MyText",
      :user_id => 1,
      :github_url => "MyString"
    ).as_new_record)
  end

  it "renders new project form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => projects_path, :method => "post" do
      assert_select "input#project_name", :name => "project[name]"
      assert_select "textarea#project_dscrptn", :name => "project[dscrptn]"
      assert_select "input#project_user_id", :name => "project[user_id]"
      assert_select "input#project_github_url", :name => "project[github_url]"
    end
  end
end
