class CreateReviews < ActiveRecord::Migration[7.1]
  def change
    create_table :reviews do |t|
      t.decimal :rating
      t.string :comment
      t.integer :type_of_review
      t.references :booking, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
