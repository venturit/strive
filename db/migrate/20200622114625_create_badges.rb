class CreateBadges < ActiveRecord::Migration[6.0]
  def change
    create_table :badges do |t|
      t.string :name, unique: true, null: false
      t.string :notes,  null: false
      t.decimal :reward, :precision => 8, :scale => 2, null: false
      t.integer :created_by
      t.integer :updated_by

      t.timestamps
    end
  end
end
