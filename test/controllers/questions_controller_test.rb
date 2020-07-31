require 'test_helper'

class QuestionsControllerTest < ActionDispatch::IntegrationTest
  
  test "should get new" do
    get new_question_path
    assert_response :success
  end

  test "should get index" do
    get root_path
    assert_response :success
  end

end
