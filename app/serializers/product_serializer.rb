class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :category, :image_url, :price, :ingredients

  has_many :reviews
  has_many :alternatives

  def alternatives
    if object.category.downcase == "green"
      return object.standard_products
    else
      return object.green_products
    end
  end
end
