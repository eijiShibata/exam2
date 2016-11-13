class Post < ActiveRecord::Base
  validates :photo, presence: true

  belongs_to :user

  mount_uploader :photo, PhotoUploader
end
