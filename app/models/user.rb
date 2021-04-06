class User < ActiveRecord::Base

  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, presence: true, length: { minimum: 3 }
  validates :password_confirmation, presence: true, length: { minimum: 3 }
  validates :email, :uniqueness => { :case_sensitive => false }, presence: true
  # validates :password_digest, presence: true
  

end
