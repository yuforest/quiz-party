class Quiz < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :responses, dependent: :destroy
  has_many :answers, dependent: :destroy
  mount_uploader :image, QuizImagesUploader
  accepts_nested_attributes_for :answers
  validates :content, presence: true
  is_impressionable
end
