class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
      t.string :product_name, null: false
      t.integer :count_of_scoops, null: false, default: 1
      t.text :toppings, array: true, default: []
      t.references :order

      t.timestamps
    end
  end
end
