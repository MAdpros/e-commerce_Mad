class CreateDeliveries < ActiveRecord::Migration[5.2]
  def change
    create_table :deliveries do |t|
      t.string :transit
      t.float :price
      t.string :mode

      t.timestamps
    end
  end
end
