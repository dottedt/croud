require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post :create, user: { app_idea: @user.app_idea, culture: @user.culture, demo_day_team: @user.demo_day_team, email: @user.email, facebook: @user.facebook, fav_book: @user.fav_book, first_name: @user.first_name, github: @user.github, hometown: @user.hometown, image: @user.image, last_name: @user.last_name, linkedin: @user.linkedin, mentor_assigned: @user.mentor_assigned, phone: @user.phone, quote: @user.quote, quote_author: @user.quote_author, twitter: @user.twitter, website: @user.website, why_ca: @user.why_ca }
    end

    assert_redirected_to user_path(assigns(:user))
  end

  test "should show user" do
    get :show, id: @user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user
    assert_response :success
  end

  test "should update user" do
    put :update, id: @user, user: { app_idea: @user.app_idea, culture: @user.culture, demo_day_team: @user.demo_day_team, email: @user.email, facebook: @user.facebook, fav_book: @user.fav_book, first_name: @user.first_name, github: @user.github, hometown: @user.hometown, image: @user.image, last_name: @user.last_name, linkedin: @user.linkedin, mentor_assigned: @user.mentor_assigned, phone: @user.phone, quote: @user.quote, quote_author: @user.quote_author, twitter: @user.twitter, website: @user.website, why_ca: @user.why_ca }
    assert_redirected_to user_path(assigns(:user))
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to users_path
  end
end