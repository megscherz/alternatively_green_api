class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :product_id, :title, :image_url, :body, :star_rating

  belongs_to :user
  belongs_to :product
end
