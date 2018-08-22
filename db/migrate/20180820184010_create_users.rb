class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.text :bio
      t.string :location
      t.integer :age
      t.string :img_url, :default => nil

      t.timestamps

    end
  end
end
