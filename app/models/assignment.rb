class Assignment < ActiveRecord::Base
  attr_accessible :course_id, :group_id, :user_id, :team_id
  
  belongs_to :user
  belongs_to :course
  belongs_to :group
  belongs_to :team
  
end

