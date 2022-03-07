class ProductAlternativesController < ApplicationController
  def create
    product_alternative = ProductAlternative.new(
      standard_product_id: params[:standard_product_id],
      green_product_id: params[:green_product_id],
    )
    if product_alternative.save
      render json: { message: "Association created successfully" }, status: :created
    else
      render json: { errors: product_alternative.errors.full_messages }, status: :bad_request
    end
  end

  def destroy
    product = ProductAlternative.find_by(id: params[:id])
    product.destroy
    render json: { message: "Association successfully deleted" }
  end
end
