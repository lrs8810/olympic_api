FactoryBot.define do
  factory :team do
    sequence(:name) { |i| "Belgium#{i}" }
  end

  trait :with_olympians do
    transient do
      olympian_count { 3 }
    end
    after(:create) do |team, evaluator|
       team.olympians << create_list(:olympian, evaluator.olympian_count)
    end
  end
end
