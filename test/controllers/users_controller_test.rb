require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get users_url
    assert_response :success
  end

  test "should get new" do
    get new_user_url
    assert_response :success
  end

  test "should create user" do
    assert_difference("User.count") do
      post users_url, params: { user: { access_enabled: @user.access_enabled, app: @user.app, average_minutes_used_last_30_days: @user.average_minutes_used_last_30_days, created_at: @user.created_at, email: @user.email, fees_last_30_days: @user.fees_last_30_days, id: @user.id, initial_access: @user.initial_access, last_access: @user.last_access, location: @user.location, name: @user.name, password: @user.password, updated_at: @user.updated_at, user_type: @user.user_type } }
    end

    assert_redirected_to user_url(User.last)
  end

  test "should show user" do
    get user_url(@user)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_url(@user)
    assert_response :success
  end

  test "should update user" do
    patch user_url(@user), params: { user: { access_enabled: @user.access_enabled, app: @user.app, average_minutes_used_last_30_days: @user.average_minutes_used_last_30_days, created_at: @user.created_at, email: @user.email, fees_last_30_days: @user.fees_last_30_days, id: @user.id, initial_access: @user.initial_access, last_access: @user.last_access, location: @user.location, name: @user.name, password: @user.password, updated_at: @user.updated_at, user_type: @user.user_type } }
    assert_redirected_to user_url(@user)
  end

  test "should destroy user" do
    assert_difference("User.count", -1) do
      delete user_url(@user)
    end

    assert_redirected_to users_url
  end
end
