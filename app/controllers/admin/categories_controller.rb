class Admin::CategoriesController < ApplicationController
  http_basic_authenticate_with name: ENV["ADMIN_USERNAME"], password: ENV["ADMIN_PASSWORD"]

  def index
    @categories = Category.all
  end

  def new
    # @product = Product.new
  end

  def create
    # @product = Product.new(product_params)

    # if @product.save
    #   redirect_to [:admin, :products], notice: 'Product created!'
    # else
    #   render :new
    # end
  end

  private

  def product_params
    # params.require(:product).permit(
    #   :name,
    #   :description,
    #   :category_id,
    #   :quantity,
    #   :image,
    #   :price
    # )
  end

end