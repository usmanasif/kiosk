FactoryBot.define do
  factory :item do
    amount 1.00

    trait :cone do
      name 'Cone'
    end

    trait :bowl do
      name 'Bowl'
    end

    trait :without_amount do
      amount nil
    end
  end
end
