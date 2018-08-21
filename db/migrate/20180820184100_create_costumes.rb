class CreateCostumes < ActiveRecord::Migration[5.2]
  def change
    create_table :costumes do |t|
      t.string :name

      t.timestamps
    end
  end
end
