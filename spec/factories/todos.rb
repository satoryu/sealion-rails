FactoryBot.define do
  factory :todo do
    content { "MyString" }
    completed_at { nil }

    trait :completed do
      completed_at { Time.zone.now }
    end
  end
end
