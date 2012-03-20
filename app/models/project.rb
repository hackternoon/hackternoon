class Project < ActiveRecord::Base
  belongs_to :user
  has_many :invitations, :dependent => :destroy

  attr_accessible :name,:dscrptn,:user_id,:github_url,:tech_tag1,:tech_tag2,:tech_tag3,
                    :biz_tag1,:biz_tag2,:biz_tag3,:updated_at

  def save
    # I want each project to have an owner
    super if self.user_id.present?
    # Else do nothing (dont call save)
  end
end

