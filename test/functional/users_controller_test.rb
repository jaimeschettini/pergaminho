require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
  end

  test "should destroy user" do
    login_user
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to users_path
  end
  
  test "admin user should not be destroyed" do
    login_user
    assert_difference('User.count', 0) do
      delete :destroy, id: User.first.id
    end

    assert_redirected_to users_path
  end
end
