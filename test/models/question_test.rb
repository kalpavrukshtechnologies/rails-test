require 'test_helper'

class QuestionTest < ActiveSupport::TestCase
  def setup
    @question = Question.new(title: 'Sample Question', private: false,
                             user_id: users(:one).id)
  end

  test 'question should be valid' do
    assert @question.valid?
  end

  test 'private should hold only true or false' do
    assert @question.valid?
    @question.private = false
    assert @question.valid?
  end

  test 'question should be present' do
    @question.title = '     '
    assert_not @question.valid?
  end

  test 'question should not be too long' do
    @question.title = 'a' * 256
    assert_not @question.valid?
  end
end
