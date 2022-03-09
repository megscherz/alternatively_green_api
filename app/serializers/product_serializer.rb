class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :category, :image_url, :price, :ingredients
end
