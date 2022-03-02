class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.string :category
      t.string :image_url
      t.integer :price
      t.string :ingredients

      t.timestamps
    end
  end
end
