class User < ActiveRecord::Base
  has_secure_password
  validates :email, presence: true, length: { maximum: 255 }, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true
  validates :name, presence: true
 
  def self.authenticate_with_credentials (email, password)
    email = email.downcase.strip
    user = User.find_by("lower(email) =?", email)
    if user && user.authenticate(password) 
      user
    else
      nil
    end
  end
end
