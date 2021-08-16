class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :item_name, null: :false
      t.text :description, null: :false
      t.references :user, foreign_key: true
      t.integer :category_id, null: :false
      t.integer :condition_id, null: :false
      t.integer :delivery_fee_id, null: :false
      t.integer :area_id, null: :false
      t.integer :shipping_day_id, null: :false
      t.integer :price, null: :false
      t.timestamps
    end
  end
end