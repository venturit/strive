class AddPerantStriveToStrive < ActiveRecord::Migration[6.0]
  def change
    add_column :strives, :parent_id, :integer
  end
end
