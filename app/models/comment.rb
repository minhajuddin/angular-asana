class Comment < ActiveRecord::Base
  attr_accessible :text, :task_id

  #associations
  belongs_to :task
end
