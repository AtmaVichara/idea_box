FactoryBot.define do
  factory :user do
    username "MyString"
    email "MyString"
    password_digest "MyString"
  end

  factory :idea do
    sequence(:body) { |n| "This is idea number #{n}"}
    sequence(:title) { |n| "Title number #{n}"}
  end

end
