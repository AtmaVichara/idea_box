class Idea < ApplicationRecord
  validates_presence_of :body, :title
  belongs_to :category
  belongs_to :user
  has_many :idea_images, dependent: :destroy
  has_many :images, through: :idea_images

  def set_images(params)
    images << params.map { |i| Image.find(i) }
  end

end
