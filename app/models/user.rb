class User < ActiveRecord::Base
  validates :name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6 }

  has_secure_password

  def self.authenticate_with_credentials(email, password)
    user = User.where('LOWER(email) = ?', email.strip.downcase).first
    user.try(:authenticate, password)
  end
end
