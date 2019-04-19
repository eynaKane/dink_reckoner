FactoryBot.define do
  factory :user do
    full_name { Faker::Name.name }
    income_cents { 60_000_00 }
  end
end
