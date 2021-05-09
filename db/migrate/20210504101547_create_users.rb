class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :nickname,null: false
      t.string :email,null: false,unique: true
      t.string :encrypted_password,null: false
      t.string :sei_zen,null: false
      t.string :mei_zen,null: false
      t.string :sei_kana,null: false
      t.string :mei_kana,null: false
      t.date :birthday,null: false
      
      t.timestamps
    end
  end
end
