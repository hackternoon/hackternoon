class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :projects

  # validates_presence_of :name
  # validates_uniqueness_of :name, :email, :case_sensitive => false
  validates_uniqueness_of :email, :case_sensitive => false

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :twitter_handle

  after_create :set_name

  # I use set_name to set the value of name to a default value when a user is created.
  def set_name
    self.name = "User#{self.id}#{Time.now.strftime('%S')}"
    self.save!
  end  

  def password_match?
    self.errors[:password] << 'password not match' if password != password_confirmation
    self.errors[:password] << 'you must provide a password' if password.blank?
    password == password_confirmation and !password.blank?
  end

end
