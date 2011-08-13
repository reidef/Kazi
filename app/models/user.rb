class User < ActiveRecord::Base
  has_secure_password
  
  has_many :tasks
  
  validates :password, :presence => true, :on => :create
  validates :email, :presence => true,
                    :uniqueness => true,
                    :email_format => true
end
