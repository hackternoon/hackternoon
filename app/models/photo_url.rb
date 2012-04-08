class PhotoUrl < ActiveRecord::Base

  # Callback before I save so I truncate large strings.
  before_save :trunc_em
  before_save :white_list

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

  # Pass all URLs through a white_list.
  def white_list
    case
    when self.the_url =~ /^http:\/\/\w+\.meetupstatic.com\/photos\/member\/.+\.jpeg/
      # Let it pass
    when self.the_url =~ /^http:\/\/gravatar.com\/avatar\/\w+/
      # Let it pass
      p 'Let it pass'
    when self.the_url =~ /^https:\/\/secure.gravatar.com\/avatar\/\w+/
      # Let it pass
      p 'Let it pass'
    when self.the_url =~ /^http:\/\/profile.ak.fbcdn.net\/.+\.jpg/
      # Let it pass
      p 'Let it pass'
    else
      # Dont let it pass
      self.the_url = nil
    end # case
  end # def white_list

end

