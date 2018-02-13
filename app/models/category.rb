class Category < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates_uniqueness_of :name
  has_many :ideas, dependent: :destroy
end
