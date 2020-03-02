FactoryBot.define do
  factory :sport do
    sequence(:name) { |i| "Diving#{i}" }

    trait :with_olympians do
      transient do
        olympian_count { 3 }
      end
      after(:create) do |sport, evaluator|
         sport.olympians << create_list(:olympian, evaluator.olympian_count)
      end
    end

    trait :with_events do
      transient do
        event_count { 3 }
      end
      after(:create) do |sport, evaluator|
         sport.events << create_list(:event, evaluator.event_count)
      end
    end
  end
end
