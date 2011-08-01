class User < ActiveRecord::Base
  has_secure_password
  
  validates :password, :presence => true
  validates :email, :presence => true,
                    :uniqueness => true,
                    :email_format => true
end
