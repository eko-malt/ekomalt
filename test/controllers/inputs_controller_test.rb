require 'test_helper'

class InputsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get inputs_new_url
    assert_response :success
  end

end
