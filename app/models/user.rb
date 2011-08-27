class User < ActiveRecord::Base
  has_secure_password
  
  has_many :tasks
  belongs_to :organization
  
  validates :password, :presence => true, :on => :create
  validates :password_confirmation, :presence => true, :on => :create
  validates :email, :presence => true,
                    :uniqueness => true,
                    :email_format => true
end
