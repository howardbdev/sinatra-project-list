class Project < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :location
  validates_presence_of :description
  belongs_to :user
  has_many :comments
end
