class CreateBootlegs < ActiveRecord::Migration
  def change
    create_table :bootlegs do |t|
      t.belongs_to :gig, index: true

      t.timestamps
    end
  end
end
