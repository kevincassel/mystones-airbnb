class AddCoordinatesToStones < ActiveRecord::Migration[6.0]
  def change
    add_column :stones, :latitude, :float
    add_column :stones, :longitude, :float
  end
end
