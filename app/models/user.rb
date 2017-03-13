class User < ActiveRecord::Base
  has_secure_password
  has_many :projects
  has_many :comments, through: :projects
  validates :username, uniqueness: true
  validates_presence_of :username
  validates_presence_of :password
end
