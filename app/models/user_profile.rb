class UserProfile < ApplicationRecord
  belongs_to :user
  mount_uploader :image, ProfileImagesUploader
end
