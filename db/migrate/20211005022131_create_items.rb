class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string  :product,         null: false
      t.text    :explanation,     null: false
      t.integer :price,           null: false
      t.integer :category_id,     null: false
      t.integer :condition_id,    null: false
      t.integer :delivery_fee_id, null: false
      t.integer :area_id,         null: false
      t.integer :shipment_id,     null: false
      t.string  :user,            null: false, foreign_key: true
      t.timestamps
    end
  end
end
