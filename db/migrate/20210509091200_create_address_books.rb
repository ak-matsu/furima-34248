class CreateAddressBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :address_books do |t|
      t.references :order,foreign_key: true
      t.string :post_num,null: false
      t.integer :prefecture_id,null: false
      t.string :city,null: false
      t.string :banchi,null: false
      t.string :tower
      t.string :phone,null: false
      
      t.timestamps
    end
  end
end
