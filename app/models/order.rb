class Order < ApplicationRecord
  enum status: [ :not_confirmed, :confirmed, :completed ]

  has_many :order_items

  validates :order_items, presence: true
  accepts_nested_attributes_for :order_items, allow_destroy: true
end
