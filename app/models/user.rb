class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :app_idea, :culture, :demo_day_team, :email, :facebook, :fav_book, :first_name,
                  :github, :hometown, :last_name, :linkedin, :mentor_assigned, :phone, :quote,
                  :quote_author, :twitter, :website, :why_ca, :user_image, :remote_user_image_url,
                  :quarter, :password, :password_confirmation, :video, :learned, :built, :what_next,
                  :before_ca, :mentor_id, :about_me

  attr_accessible :notes_attributes

  # has_secure_password

  has_many :assignments
  has_many :notes
  accepts_nested_attributes_for :notes, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true

  has_many :courses, :through  =>  :assignments
  has_many :groups, :through  => :assignments
  has_many :teams, :through => :assignments

  scope :student, User.where("assignments.group_id = '1'").joins(:assignments).uniq
  scope :filter, lambda { |model, id| User.where("assignments.#{model}_id = '#{id}'").joins(:assignments)}

  def note_attributes=(note_attributes)
      note_attributes.each do |attributes|
        note.build(attributes)
      end
  end


  def team_name
    self.teams.collect(&:name).uniq.join(", ")
  end

  def team_id
    self.teams.collect(&:id)
  end

  def team_description
    self.teams.collect(&:description)
  end

  def full_name
    first_name + " " + last_name
  end

  def mentor_uid
      first = self.mentor_assigned.split(' ').first
      last = self.mentor_assigned.split(' ').last
      m = User.where :first_name => "#{first}", :last_name => "#{last}"
      mid = m.first.id
      return mid
  end

  def user_sprint_managers
    team = Team.find(self.team_id).first
    a = []
    team.assignments.each do |assignment|
       if assignment.group_id == 7
          a << assignment.user
       end
     end
    return a
  end

  def self.mentees
    a = []
     self.all.each do |user|
        if user.mentor_assigned?
           a << user
        end
      end
     return a
   end
  def self.search(search)
    if search
    where 'first_name LIKE ?', "%#{search}%"
    else
    scoped
    end
  end

end
