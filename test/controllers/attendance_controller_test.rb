require 'test_helper'

class AttendanceControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get attendance_create_url
    assert_response :success
  end

end
