class Category < ApplicationRecord
  has_many :quiz
  def to_param
    return slug
  end
end
