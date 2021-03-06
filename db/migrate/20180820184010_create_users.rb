class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.string :name
      t.text :bio
      t.string :location
      t.integer :age
      t.string :img_url
      t.timestamps
    end
  end
end
