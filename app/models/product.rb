class Product < ApplicationRecord
  has many: reviews

  has_many :green_alternatives, class_name: "ProductAlternative", foreign_key: "standard_product_id"
  has_many :green_products, through: :green_alternatives, source: :green_product
  has_many :standard_alternatives, class_name: "ProductAlternative", foreign_key: "green_product_id"
  has_many :standard_products, through: :standard_alternatives, source: :standard_product"
end
