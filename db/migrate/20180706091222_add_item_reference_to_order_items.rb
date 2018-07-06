class AddItemReferenceToOrderItems < ActiveRecord::Migration[5.2]
  def change
    add_reference :order_items, :item
    remove_column :order_items, :product_name
  end
end
