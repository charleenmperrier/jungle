class User < ActiveRecord::Base

  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, presence: true, length: { minimum: 3 }
  validates :password_confirmation, presence: true, length: { minimum: 3 }
  validates :email, :uniqueness => { :case_sensitive => false }, presence: true
  
  def self.authenticate_with_credentials email, password
    user = self.find_by_email(email.strip.downcase)

    if user && user.authenticate(password)
      user
    else
      nil
    end
  end
  

end
