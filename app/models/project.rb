class Project < ActiveRecord::Base

  # Callback before I save so I truncate large strings.
  before_save :trunc_em

  # Associations come after callbacks.
  # http://api.rubyonrails.org/classes/ActiveRecord/Callbacks.html
  belongs_to :user
  has_many :invitations, :dependent => :destroy

  attr_accessible :name,:dscrptn,:user_id,:github_url,:tech_tag1,:tech_tag2,:tech_tag3,:biz_tag1,:biz_tag2,:biz_tag3

  # I want each project to have an owner.
  def save
    super if self.user_id.present?
    # Else do nothing (dont call save)
  end

  # I distrust large strings.
  def trunc_em
    self.name       = self.name.truncate 40
    self.dscrptn    = self.dscrptn.truncate 1234
    self.github_url = self.github_url.truncate 70
    self.tech_tag1  = self.tech_tag1.truncate 25
    self.tech_tag2  = self.tech_tag2.truncate 25
    self.tech_tag3  = self.tech_tag3.truncate 25
    self.biz_tag1   = self.biz_tag1.truncate 30
    self.biz_tag2   = self.biz_tag2.truncate 30
    self.biz_tag3   = self.biz_tag3.truncate 30
  end # def trunc_em
end

