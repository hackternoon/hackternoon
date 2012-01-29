require 'spec_helper'

describe ConfirmationsController do

  describe "GET 'show'" do
    it "returns http success" do
      get 'show'
      response.should be_success
    end
  end

  describe "GET 'confirm_user'" do
    it "returns http success" do
      get 'confirm_user'
      response.should be_success
    end
  end

end
