class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.belongs_to :type
      t.belongs_to :article
      t.float :price
      t.boolean :disponibility, :default => true

      t.timestamps
    end
  end
end
