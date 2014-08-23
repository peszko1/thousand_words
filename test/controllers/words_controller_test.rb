require 'test_helper'

class WordsControllerTest < ActionController::TestCase
  test "should get train" do
    get :train
    assert_response :success
  end

end
