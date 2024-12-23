require "test_helper"

class UsersSignupTest < ActionDispatch::IntegrationTest
  test "invalid signup information" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, params: { user: { name:  "",
                                         email: "user@invalid",
                                         password:"Pass",
                                         password_confirmation: "Word" } }
    end
    assert_response :unprocessable_entity
    assert_template 'users/new'
    assert is_logged_in?
  end
end
