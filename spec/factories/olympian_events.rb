FactoryBot.define do
  factory :olympian_event do
    medal { "Bronze" }
    olympian
    event
  end
end
