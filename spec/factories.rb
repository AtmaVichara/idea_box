FactoryBot.define do

  factory :idea do
    sequence(:body) { |n| "This is idea number #{n}"}
    sequence(:title) { |n| "Title number #{n}"}
  end

end
