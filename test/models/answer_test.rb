require 'test_helper'

class AnswerTest < ActiveSupport::TestCase
  def setup
    @question = questions(:rails)
    @answer = @question.answers.build(content: 'Lorem ipsum')
  end
  
  test "@answerの有効性を確認" do
    assert @answer.valid?
  end
  
  test "contentが空の場合、有効性は否定される" do
    @answer.content = ""
    assert_not @answer.valid?
  end
  
  test "question_idが空の場合、有効性は否定される" do
    @answer.question_id = nil
    assert_not @answer.valid?
  end
  
  test "新しい回答が一番上に来ることを確認" do
    assert_equal answers(:one), Answer.first
  end
  
end
