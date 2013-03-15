class Task < ActiveRecord::Base
  attr_accessible :completed, :description, :title, :comments_attributes

  #associations
  has_many :comments

  accepts_nested_attributes_for :comments

end
