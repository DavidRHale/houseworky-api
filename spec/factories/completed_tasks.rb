FactoryBot.define do
  factory :completed_task do
    title { Faker::LordOfTheRings.character }
    created_by { Faker::Number.number(10) }
    room { Faker::LordOfTheRings.location }
  end
end
