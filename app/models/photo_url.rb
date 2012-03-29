class PhotoUrl < ActiveRecord::Base

  # Callback before I save so I truncate large strings.
  before_save :trunc_em

  # Associations come after callbacks.
  # http://api.rubyonrails.org/classes/ActiveRecord/Callbacks.html
  belongs_to :user

  attr_accessible :the_url, :profile_photo

  # I want each photo_url to have an owner.
  def save
    super if self.user_id.present?
    # Else do nothing (dont call save)
  end

  # I distrust large strings.
  def trunc_em
    self.the_url = self.the_url.truncate 200
  end # def trunc_em
end

