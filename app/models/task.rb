class Task < ActiveRecord::Base
  attr_accessible :name, :complete
  
  belongs_to :user
end
