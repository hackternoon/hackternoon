class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # Callback before I create so I have at least something for a name.
  before_create :set_name

  # Callback before I save so I truncate large strings.
  before_save :trunc_em

  # Associations come after callbacks.
  # http://api.rubyonrails.org/classes/ActiveRecord/Callbacks.html
  has_many :projects, :dependent => :destroy
  has_many :invitations, :dependent => :destroy
  has_many :projects_invited_to, :through => :invitations, :source => :project

  validates_uniqueness_of :email, :case_sensitive => false

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, 
    :twitter_handle, :location, :photo_url

  # I use set_name to set the value of name to a default value when a user is created.
  def set_name
    # I truncate it too. I dislike big names.
    self.name = self.email.truncate 25
    self.photo_url = 'http://0.gravatar.com/avatar/fa3c0e79ecfe1f9e2cdc906ae34b14ee'
  end  

  # Does the password match the password confirmation in the form?
  def password_match?
    self.errors[:password] << 'password not match' if password != password_confirmation
    self.errors[:password] << 'you must provide a password' if password.blank?
    password == password_confirmation and !password.blank?
  end # def password_match?

  # I distrust large strings.
  def trunc_em
    self.name           = self.name.truncate 30           if self.name.present?
    self.twitter_handle = self.twitter_handle.truncate 30 if self.twitter_handle.present?
    self.location       = self.location.truncate 40       if self.location.present?
    self.photo_url      = self.photo_url.truncate 200     if self.photo_url.present?
  end # def trunc_em

end
