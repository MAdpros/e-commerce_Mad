class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :description
      t.string :season
      t.string :origin
      t.string :image_url

      t.timestamps
    end
  end
end
