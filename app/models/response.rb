class Response < ApplicationRecord
  belongs_to :quiz
  validates :content, presence: true

  def name_or_annonymous
    return name if name
    "匿名"
  end

  def is_correct?
    quiz.answers.each do |answer|
      return true if answer.content == self.content
    end
    false
  end
end
