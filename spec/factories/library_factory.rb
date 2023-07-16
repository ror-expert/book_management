FactoryBot.define do
  factory :library do
    name { Faker::Name.name }
  end
end
