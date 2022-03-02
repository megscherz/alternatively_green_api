class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.integer :user_id
      t.integer :product_id
      t.string :title
      t.string :image_url
      t.text :body
      t.integer :star_rating

      t.timestamps
    end
  end
end
