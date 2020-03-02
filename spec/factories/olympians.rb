FactoryBot.define do
  factory :olympian do
    sequence(:full_name) { |i| "Maizurah Abdul Rahim#{i}" }
    sex { "F" }
    sequence(:age) { |i| 19 + i }
    sequence(:height) { |i| 165 + i }
    sequence(:weight) { |i| 61 + i }
    sport
    team

    trait :with_olympian_events do
      transient do
        olympian_event_count { 3 }
      end
      after(:create) do |olympian, evaluator|
         olympian.olympian_events << create_list(:olympian_event, evaluator.olympian_event_count)
      end
    end
  end
end
