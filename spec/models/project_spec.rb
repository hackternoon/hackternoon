require 'spec_helper'

describe Project do

  before(:each) do
    if ENV["RAILS_ENV"] == "test"
      User.destroy_all
      Project.destroy_all
    end
    @user = FactoryGirl.create(:user)
  end # before

  it "should have a page() method from kaminari gem" do
    (10..20).each{|n| eval "@project#{n}=FactoryGirl.create(:project,:name=>'project#{n}',:user_id=>@user.id)"}
    # I want page 1 and I want 4 projects per page:
    @pg1 = Project.order("name").page(1).per(4)
    @pg1.size.should == 4
    @pg1.first.name.should == "project10"
    @pg1.last.name.should == "project13"
  end

end
