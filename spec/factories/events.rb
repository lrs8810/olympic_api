FactoryBot.define do
  factory :event do
    sequence(:name) { |i| "Diving Women's Platform#{i}" }
    sport

    trait :with_olympian_events do
      transient do
        olympian_event_count { 3 }
      end
      after(:create) do |event, evaluator|
         event.olympian_events << create_list(:olympian_event, evaluator.olympian_event_count)
      end
    end
  end
end
