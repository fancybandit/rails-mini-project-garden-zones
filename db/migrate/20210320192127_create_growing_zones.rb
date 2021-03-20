class CreateGrowingZones < ActiveRecord::Migration[6.1]
  def change
    create_table :growing_zones do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end