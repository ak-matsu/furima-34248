class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :user,foreign_key: true
      t.string :name
      t.text :text
      t.integer :category_id
      t.integer :status_id
      t.integer :delivery_money_id
      t.integer :prefecture_id
      t.integer :delivery_day_id
      t.integer :price


      t.timestamps
    end
  end
end
