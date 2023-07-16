FactoryBot.define do
  factory :book do
    name { Faker::Book.title }
    description { Faker::Book.publisher }
  end
end
