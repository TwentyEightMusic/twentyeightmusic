class ChangeTimeToString < ActiveRecord::Migration
  def change
    change_column :gigs, :start_time, :time, null: false
  end
end
