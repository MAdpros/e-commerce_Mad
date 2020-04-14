class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :name, null: false
      t.text :address, null: false
      t.string :email, null: false
      t.integer :status, null: false, default: 0
      t.references :cart

      t.belongs_to :zone, index: true
      t.belongs_to :user, index: true
      t.timestamps
    end
  end
end
