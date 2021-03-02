class RenameTouchColumnToStones < ActiveRecord::Migration[6.0]
  def change
    rename_column :stones, :touch, :sensation
  end
end
