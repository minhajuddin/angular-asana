class Task < ActiveRecord::Base
  attr_accessible :completed, :description, :title

  #associations
  has_many :comments
end
