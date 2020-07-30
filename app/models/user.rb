class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable
  has_many :quizzes,     dependent: :destroy
  has_one :user_profile, dependent: :destroy
  after_create :init_profile

  def init_profile
    self.build_user_profile.save(validate: false)
  end

  def user_name
    return user_profile.name if user_profile.name.present?
    "匿名"
  end

  def user_image(size: :thumb)
    return user_profile.image.send(size).url if user_profile.image.present?
    return "default_user.png"
  end
end
