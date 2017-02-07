class User < ActiveRecord::Base
  has_secure_password
  has_many :projects
  validates :username, uniqueness: true
  validates_presence_of :username
  validates_presence_of :password
end
