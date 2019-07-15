require 'test_helper'

class HelpControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get help_home_url
    assert_response :success
  end

end
