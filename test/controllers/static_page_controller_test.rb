require 'test_helper'

class StaticPageControllerTest < ActionDispatch::IntegrationTest
  test "should get about" do
    get static_page_about_url
    assert_response :success
  end

end
