require 'spec_helper'

describe Project do
debugger
  @user = FactoryGirl.build(:user)
  @project = FactoryGirl.build(:project)
  @project.user = @user
end
