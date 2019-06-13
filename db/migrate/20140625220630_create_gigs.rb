class CreateGigs < ActiveRecord::Migration[4.2]
  def change
    create_table :gigs do |t|
      t.string :venue, null: false
      t.datetime :start_time, null: false

      t.timestamps
    end
  end
end
