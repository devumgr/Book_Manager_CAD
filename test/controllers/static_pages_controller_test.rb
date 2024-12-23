require "test_helper"

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  test "should get root" do
    get root_path
    assert_response :success
  end

  test "should get home" do
    get home_path
    assert_response :success
    #assert_select "title", "Home | Book Manager System"
  end
  
  test "should get about" do
    get about_path
    assert_response :success
    #assert_select "title", "About | Book Manager System"
  end

  test "should get contact" do
    get contact_path
    assert_response :success
    #assert_select "title", "Contact | Book Manager System"
  end
end

