class Note < ActiveRecord::Base
  attr_accessible :description, :guest_id, :star, :user_id
  belongs_to :user
end
