class User < ActiveRecord::Base
  has_many :todos, dependent: :destroy
  attr_accessible :password, :username
end
