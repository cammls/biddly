class Product < ApplicationRecord
mount_uploader :picture, PictureUploader
  belongs_to :user
  belongs_to :category
  validates :title, presence: true, uniqueness: true
  validates :description, presence: true
  # validates :price, presence: true
  validates :price, :numericality => { :greater_than_or_equal_to => 0 }
  validates :category_id, presence: true

  def self.search(search)
  if search
    # find(:all, :conditions => ['title LIKE ?', "%#{search}%"])
    where(['title LIKE ?', "%#{search}%"])
  end
end
end
