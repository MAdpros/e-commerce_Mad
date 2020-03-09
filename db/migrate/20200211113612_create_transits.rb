class CreateTransits < ActiveRecord::Migration[5.2]
  def change
    create_table :transits do |t|
      t.string :name
      t.string :mode
      t.float :price

      t.timestamps
    end
  end
end
