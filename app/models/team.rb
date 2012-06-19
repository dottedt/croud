class Team < ActiveRecord::Base
  attr_accessible :description, :name, :url
  
  has_many :assignments

  has_many :users, :through  =>  :assignments
           
  
  def student_members
    a = []
    self.assignments.each do |assignment|
       if assignment.group_id == 1
          a << assignment.user
       end
     end
    return a
  end

  def sprint_managers
    a = []
    self.assignments.each do |assignment|
       if assignment.group_id == 7
          a << assignment.user
       end
     end
    return a
  end
  
  
  
end
