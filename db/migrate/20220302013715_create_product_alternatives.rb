class CreateProductAlternatives < ActiveRecord::Migration[7.0]
  def change
    create_table :product_alternatives do |t|
      t.integer :standard_product_id
      t.integer :green_product_id

      t.timestamps
    end
  end
end
