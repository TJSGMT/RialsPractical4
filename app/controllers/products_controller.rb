class ProductsController < ApplicationController
before_action :find_products, only: [:edit ,:show ,:update ,:destroy] 
  
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.create(product_params)
    if @product.valid?
      redirect_to products_path
    else
        flash[:error] = @product.errors.full_messages
        redirect_to products_path
    end
  end

  def edit
  end

  def show
  end

  def update
    if @product.update(product_params)
      flash[:error] = " Products is Successfully updated!!!"
      redirect_to products_path
    else
      flash[:error] = @product.error_full_messages
      redirect_to products_path  
    end
  end

  def destroy
    @product.destroy
    redirect_to products_path
  end

  def find_products
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:product_name ,:price ,:description,:user_id)
  end
end
