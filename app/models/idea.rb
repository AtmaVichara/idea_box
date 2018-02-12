class Idea < ApplicationRecord
  validates_presence_of :body, :title
  belongs_to :category
  belongs_to :user
end
