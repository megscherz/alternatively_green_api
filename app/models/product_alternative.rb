class ProductAlternative < ApplicationRecord
  belongs_to :green_product, class_name: "Product"
  belongs_to :standard_product, class_name: "Product"
end
