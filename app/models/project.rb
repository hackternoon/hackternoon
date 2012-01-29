class Project < ActiveRecord::Base
  belongs_to :user
  def save
    # I want each project to have an owner
    super if self.user_id.present?
  end
end
