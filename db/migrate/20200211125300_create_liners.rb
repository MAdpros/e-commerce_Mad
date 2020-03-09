class CreateLiners < ActiveRecord::Migration[5.2]
  def change
    create_table :liners do |t|
      t.belongs_to :delivery, foreign_key: true
      t.belongs_to :transit, foreign_key: true

      t.timestamps
    end
  end
end
