class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :product_id, :title, :image_url, :body, :star_rating
end
