class CreateLineItems < ActiveRecord::Migration[5.2]
  def change
    create_table :line_items do |t|
      t.belongs_to :cart, index: true
      t.belongs_to :product, index: true
      t.integer :quantity, default: 1

      t.belongs_to :user, index: true
      t.timestamps
    end
  end
end
