class CreateCharacters < ActiveRecord::Migration[5.2]
  def change
    create_table :characters do |t|
      t.string :name
      t.string :motto
      t.integer :ability_id
      t.timestamps
    end
  end
end
