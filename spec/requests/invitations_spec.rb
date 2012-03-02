require 'spec_helper'

describe "Invitations" do
  describe "GET /invitations" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get invitations_path
      response.status.should be(200)
    end
  end
end
