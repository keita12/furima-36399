class CreateShippingInformations < ActiveRecord::Migration[6.0]
  def change
    create_table :shipping_informations do |t|
      t.string :telephone_num, null: :false
      t.string :postal_code, null: :false
      t.string :area_id, null: :false
      t.string :municipalities, null: :false
      t.string :address, null: :false
      t.string :building_name
      t.references :record, foreign_key: true
      t.timestamps
    end
  end
end
