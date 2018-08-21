class CreateAvatars < ActiveRecord::Migration[5.2]
  def change
    create_table :avatars do |t|
      t.string :name
      t.integer :likes
      t.integer :user_id
      t.integer :costume_id
      t.integer :character_id

      t.timestamps
    end
  end
end
