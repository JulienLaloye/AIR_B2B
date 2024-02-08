class CreateBookings < ActiveRecord::Migration[7.1]
  def change
    create_table :bookings do |t|
      t.date :date_begin
      t.date :date_end
      t.integer :status
      t.references :user, null: false, foreign_key: true
      t.references :dj, null: false, foreign_key: true

      t.timestamps
    end
  end
end
