class CreateBootlegs < ActiveRecord::Migration[4.2]
  def change
    create_table :bootlegs do |t|
      t.belongs_to :gig, index: true

      t.timestamps
    end
  end
end
