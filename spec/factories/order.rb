FactoryBot.define do
  factory :order do
    trait :with_order_items do
      order_items_attributes { [FactoryBot.attributes_for(:order_item)] }
    end

    trait :without_order_items do
      order_items_attributes { [] }
    end
  end
end
