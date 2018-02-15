class IdeaImage < ApplicationRecord
  belongs_to :image, optional: true
  belongs_to :idea, optional: true 
end
