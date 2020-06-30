class CreateStrives < ActiveRecord::Migration[6.0]
  def change
    create_table :strives do |t|
      t.integer :awarder_id, null: false, index: {unique: false}
      t.integer :awardee_id, null: false, index: {unique: false}
      t.integer :badge_id, null: false, index: {unique: false}
      t.integer :strive_category_id, null: false, index: {unique: false}
      t.text :reason, null: false, index: {unique: false}
      t.integer :request_id, index: {unique: true},  allow_blank: true
      t.boolean :cashed_out, null: false, index: {unique: false}, default: false

      t.timestamps
    end
  end
end
