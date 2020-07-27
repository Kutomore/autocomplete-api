FactoryBot.define do
  factory :book do
    title { Faker::Book.title }
    author { Faker::Book.author }
    publisher { Faker::Book.publisher }
    genre { Faker::Book.genre }
    published_at { Faker::Date.in_date_period }
  end
end
