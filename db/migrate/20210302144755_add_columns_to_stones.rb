class AddColumnsToStones < ActiveRecord::Migration[6.0]
  def change
    add_column :stones, :zip, :string
    add_column :stones, :town, :string
    add_column :stones, :country, :string
  end
end
