class Product < ApplicationRecord
mount_uploader :picture, PictureUploader
  belongs_to :user
  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true
end
