class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :omniauthable, omniauth_providers: [:twitter]
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

  def self.from_omniauth(auth)
    user = joins(:socials).where("socials.uid = ?", auth.uid)
                          .where("socials.provider = ?", auth.provider)
                          .first
    if user.present?
      return user
    else
      user = User.new(email: auth.info.email, password: Devise.friendly_token[0,20])
      user.skip_confirmation!
      user.socials.new(provider: auth.provider, uid: auth.uid)
      user.save!
      return user
    end
  end
end
