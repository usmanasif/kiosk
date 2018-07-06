FactoryBot.define do
  factory :order_item do
    count_of_scoops 1
    toppings ['Almonds']
    item_id { create(:item, :cone).id }
  end
end
