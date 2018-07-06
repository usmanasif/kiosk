class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :item

  PRODUCTS = ['Cone', 'Bowl'].freeze
  TOPPINGS = ['Almonds', 'Caramel', 'Chocolate Chips'].freeze
  SCOOPS = ['1', '2', '3'].freeze
  TOPPING_PRICE = 0.10

  validates :product_name, :count_of_scoops, presence: true
  validate :check_count_of_scoops
  validate :count_of_toppings

  def amount
    (self.count_of_scoops * self.item.amount) + (self.toppings.length * TOPPING_PRICE)
  end

  def product_name
    self.item&.name
  end

  private
    def count_of_toppings
      if self.product_name == 'Cone' && self.toppings.length > 1
        errors.add(:toppings, "Cannot exceed from 1 for #{self.product_name}")
      elsif self.product_name == 'Bowl' && self.toppings.length > 2
        errors.add(:toppings, "Cannot exceed from 2 for #{self.product_name}")
      end
    end

    def check_count_of_scoops
      return if self.count_of_scoops.blank?

      if self.product_name == 'Cone' && self.count_of_scoops > 2
        errors.add(:scoops, "Cannot exceed from 2 for #{self.product_name}")
      elsif self.product_name == 'Bowl' && self.count_of_scoops > 3
        errors.add(:scoops, "Cannot exceed from 3 for #{self.product_name}")
      end
    end
end
