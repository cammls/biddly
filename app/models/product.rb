class Product < ApplicationRecord
mount_uploader :picture, PictureUploader
  belongs_to :user
  belongs_to :category
  validates :title, presence: true, uniqueness: true
  validates :description, presence: true
  validates :price, presence: true
  validates :category_id, presence: true
end
