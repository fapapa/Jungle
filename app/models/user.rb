class User < ActiveRecord::Base
  validates :name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6 }

  has_secure_password

  def self.authenticate_with_credentials(email, password)
    User.find_by(email: email.strip).try(:authenticate, password)
  end
end
