class Quiz < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :responses, dependent: :destroy
  mount_uploader :image, QuizImagesUploader
end
