class Order < ApplicationRecord
  enum status: [ :not_confirmed, :confirmed, :completed ]

  has_many :order_items, dependent: :destroy

  validates :order_items, presence: true
  accepts_nested_attributes_for :order_items, allow_destroy: true

  def amount
    self.order_items.sum(&:amount)
  end

  def number
    '%04d' % self.id
  end
end
