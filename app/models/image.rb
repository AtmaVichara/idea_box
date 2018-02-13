class Image < ApplicationRecord
  has_many :idea_images
  has_many :ideas, through: :idea_images
  has_attached_file :image
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]

end
