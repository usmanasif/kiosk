class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, null: false, limit: 50
      t.decimal :amount, precision: 6, scale: 2, null: false

      t.timestamps
    end
  end
end
