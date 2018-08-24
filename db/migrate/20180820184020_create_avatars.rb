class CreateAvatars < ActiveRecord::Migration[5.2]
  def change
    create_table :avatars do |t|
      t.string :name
      t.integer :likes, default: 0
      t.integer :user_id
      t.integer :costume_id
      t.integer :character_id
      t.string :img_url, default: nil
      t.string :ability_id

      t.timestamps
    end
  end
end
