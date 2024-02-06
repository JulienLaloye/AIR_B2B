class CreateDjs < ActiveRecord::Migration[7.1]
  def change
    create_table :djs do |t|
      t.string :name
      t.integer :price_per_day
      t.string :genre
      t.string :location
      t.integer :capacity
      t.string :description
      t.string :picture
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
