class CreateGigs < ActiveRecord::Migration
  def change
    create_table :gigs do |t|
      t.string :venue, null: false
      t.time :start_time, null: false

      t.timestamps
    end
  end
end
