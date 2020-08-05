class Category < ApplicationRecord
  has_many :quizzes
  def to_param
    return slug
  end
end
