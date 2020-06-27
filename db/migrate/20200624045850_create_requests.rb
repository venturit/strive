class CreateRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :requests do |t|
      t.integer :requestor_id, null: false, index: {unique: false}
      t.integer :recipient_id, null: false, index: {unique: false}
      t.integer :badge_id, null: false, index: {unique: false}
      t.text :reason, null: false
      t.integer :strive_category_id, null: false, index: {unique: false}
      t.integer :backer_id, null: false, index: {unique: false}
      t.integer :requestee_id, null: false, index: {unique: false}
      t.timestamps
    end
  end
end
