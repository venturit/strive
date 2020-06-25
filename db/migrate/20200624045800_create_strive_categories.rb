class CreateStriveCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :strive_categories do |t|
      t.string :name, null: false, index: {unique: true}
      t.text :description, null: false
      t.integer :updated_by
      t.integer :created_by
      t.timestamps
    end
  end
end
