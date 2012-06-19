class UsersController < ApplicationController

  # before_filter :require_sign_in, :only => [:edit]
  # before_filter :require_correct_user, :only => :edit

  # def require_correct_user
  #   n = User.find(params[:id])
  #   if n != @user
  #     redirect_to root_url, notice: "Not authorized to edit this page"
  #   end
  # end

  # def require_sign_in
  #   @user = User.find_by_id(session[:uid])
  #   if @user.nil?
  #     redirect_to sign_in_url, notice: 'Please sign in first!'
  #   end
  # end

  def index
    @users = User.paginate(:page => params[:page], :per_page => 20)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
      format.js
    end
  end

  # NOTE: Seperate 'filter' actions need to be refactored at first chance!
  def students
    @users = User.paginate(:page => params[:page], :per_page => 20).student
    @filter = "All Students"
    render :index
  end

  def webdev
    @users = User.paginate(:page => params[:page], :per_page => 20).where("assignments.course_id = '1' or assignments.course_id = '2'").joins(:assignments)
    @filter = "Web Development"
    render :index
  end

  def html
    @users = User.paginate(:page => params[:page], :per_page => 20).filter("course", "3")
    @filter = "HTML/CSS"
    render :index
  end

  def ux
    @users = User.paginate(:page => params[:page], :per_page => 20).filter("course", "4")
    @filter = "UX"
    render :index
  end

  def alumni
    @users = User.paginate(:page => params[:page], :per_page => 20).filter("group", "2")
    @filter = "Alumni"
    render :index
  end

  def staff
    @users = User.paginate(:page => params[:page], :per_page => 20).filter("group","4")
    @filter = "Staff"
    render :index
  end

  def mentor
    # @users = User.filter("group", "3")
    @users = User.paginate(:page => params[:page], :per_page => 20).filter("group", "3")
    @filter = "Mentor"
    render :index
  end

  def show
    @user = User.find(params[:id])
    @note = Note.all

        respond_to do |format|
          format.html # show.html.erb
          format.json { render json: @user }
        end
  end

  def new
    @user = User.new


    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

   def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(params[:user])
    @note = Note.new(params[:note])

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
end
