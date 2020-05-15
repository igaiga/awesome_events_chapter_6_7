require 'test_helper'

class StatusControllerTest < ActionDispatch::IntegrationTest
  test "GET /status" do
    get "/status" #((1))
    assert_response(:success) #((2))
    assert_equal({ status: "ok" }.to_json, @response.body) #((3))
    assert_equal("application/json", @response.media_type) #((4))
  end
end
