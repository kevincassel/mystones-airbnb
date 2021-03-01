class CreateStones < ActiveRecord::Migration[6.0]
  def change
    create_table :stones do |t|
      t.string :name
      t.string :category
      t.integer :age
      t.float :size
      t.float :weight
      t.text :description
      t.string :gender
      t.string :touch
      t.float :price
      t.string :address
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
