class Project < ActiveRecord::Base
  belongs_to :user
  has_many :invitations

  def save
    # I want each project to have an owner
    super if self.user_id.present?
    # Else do nothing (dont call save)
  end
end

