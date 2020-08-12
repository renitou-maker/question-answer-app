require 'test_helper'

class QuestionsControllerTest < ActionDispatch::IntegrationTest

  test "should get index" do
    get root_path
    assert_response :success
  end
  
  def setup
    @question = questions(:rails)
  end
  
  test '非ログイン状態でQuestion作成フォームにアクセスしようとした場合、ログインフォームにリダイレクトされる。' do
    get new_question_path
    assert_redirected_to login_url
  end
  
  test "非ログイン状態でQuestionを作成しようとした場合、ログインフォームにリダイレクトされる" do
    assert_no_difference 'Question.count' do
      post questions_path, params: { question: { title: 'title', content: "Lorem ipsum" }}
    end
    assert_redirected_to login_url
  end
  
  test "非ログイン状態でQuestionを削除しようとした場合、ログインフォームにリダイレクトされる" do
    assert_no_difference 'Question.count' do
      delete question_path(@question)
    end
    assert_redirected_to login_url
  end

end
