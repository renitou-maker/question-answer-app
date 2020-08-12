require 'test_helper'

class QuestionTest < ActiveSupport::TestCase
  
  def setup
    @user = users(:ren)
    @question = @user.questions.build(title: '初めての質問', content: 'railsとは何？', user_id: @user.id)
  end
  
  test 'Questionから作成されたインスタンスの有効性を確認' do
    assert @question.valid?
  end
  
  test "Questionにuser_idが無い場合には有効性が否定される" do
    @question.user_id = nil
    assert_not @question.valid?
  end
  
  test 'titleが空であるとき、有効性が否定される' do
    @question.title = ""
    assert_not @question.valid?
  end
  
  test 'contentが空であるときは有効性が否定される' do
    @question.content = "  "
    assert_not @question.valid?
  end
  
  
  
  test 'titleは100文字まで、101文字以上は有効性を否定される' do
    @question.title = "a" * 101
    assert_not @question.valid?
  end
  
  test "contentは5000文字まで、5001文字以上は有効性を否定される" do
    @question.content = "a" * 5001
    assert_not @question.valid?
  end
  
  
  
  test "新しい質問が先頭に来る事を確認" do
    assert_equal questions(:rails), Question.first
  end
  
end