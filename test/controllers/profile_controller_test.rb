require "test_helper"

class ProfileControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get profile_show_url
    assert_response :success
  end

  test "should get index" do
    get profile_index_url
    assert_response :success
  end

  test "should get destroy" do
    get profile_destroy_url
    assert_response :success
  end
end
