class Quiz < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :responses, dependent: :destroy
  has_many :answers, dependent: :destroy
  mount_uploader :image, QuizImagesUploader
  accepts_nested_attributes_for :answers
  validates :content, presence: true
  is_impressionable
  accepts_nested_attributes_for :answers, allow_destroy: true

  scope :search_by_user_id, -> (user_id) {
    return if user_id.nil?
    where(user_id: user_id)
  }

  scope :add_responses_count, -> {
    left_joins(:responses)
      .select("quizzes.*,COUNT(responses.id) AS responses_count")
      .group("quizzes.id")
  }

  def correct_answer_rate
    corerct_count = 0
    responses.each do |response|
      answers.each do |answer|
        next if response.content != answer.content
        corerct_count += 1
      end
    end
    (corerct_count * 100 / responses.count.to_f).round(1)
  end
end
