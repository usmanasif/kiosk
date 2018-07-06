class Item < ApplicationRecord
  validates :name, :amount, presence: true
end
