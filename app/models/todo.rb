class Todo < ActiveRecord::Base
  belongs_to :user
  attr_accessible :todo_item
  validates :todo_item, presence: true
end
