FactoryBot.define do
  factory :order_item do
    product_name 'Cone'
    count_of_scoops 1
    toppings ['Almonds']
  end
end
