FactoryBot.define do

  factory :idea do
    sequence(:body) { |n| "This is idea number #{n}"}
  end
  
end
