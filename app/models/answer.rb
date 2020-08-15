class Answer < ApplicationRecord
  belongs_to :question
  default_scope -> { order(created_at: :desc) }
  validates :content, presence: true
  validates :question_id, presence: true
end
