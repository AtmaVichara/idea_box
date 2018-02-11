FactoryBot.define do

  factory :idea do
    sequence(:body) { |n| "This is idea number #{n}"}
    sequence(:title) { |n| "Title number #{n}"}
    category
  end

  factory :user do
    sequence(:username) { |n| "AtmaVicharaEsq#{n}"}
    sequence(:email) { |n| "living_in_atma#{n}@gmail.com"}
    sequence(:password) { |n| "password#{n}"}
  end

  factory :category do
    sequence(:name) { |n| "#{n} Number of KettlePops"}
  end
end
