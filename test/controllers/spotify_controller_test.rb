require 'test_helper'

class SpotifyControllerTest < ActionDispatch::IntegrationTest
  test "should get search" do
    get spotify_search_url
    assert_response :success
  end

end
