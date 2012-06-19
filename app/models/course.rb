class Course < ActiveRecord::Base
  attr_accessible :end_date,
                :name,
                :start_date,
                :monday,
                :tuesday,
                :wednesday,
                :thursday,
                :friday,
                :saturday,
                :sunday


  has_many :assignments

  has_many :users, :through => :assignments
end



