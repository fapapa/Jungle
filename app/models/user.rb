class User < ActiveRecord::Base
  validates :name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6 }

  has_secure_password

  def self.authenticate_with_credentials(email, password)
    user = User.find_by(email: email) || false
    user ? user.authenticate(password) : false
  end
end
