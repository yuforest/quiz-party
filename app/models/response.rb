class Response < ApplicationRecord
  belongs_to :quiz
  validates :content, presence: true
end
