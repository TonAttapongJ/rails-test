class Admin::ProductsController < ApplicationController
    before_action :user_signed_in?

    def index
        @products = Product.all
    end
    
    def new
        @product = Product.new
    end

    def show
        @product = Product.find(params[:id])
    end

    def create
        @product = Product.new(products_params)
        if @product.save
            redirect_to admin_products_path
        else 
            render :new
        end
    end
    
    def update
        @product = Product.find(params[:id])
        if @product.update(products_params)
            redirect_to admin_products_path
        else 
            render :edit
        end
    end

    def edit
        @product = Product.find(params[:id])
    end

    def destroy
        @product = Product.find(params[:id])
        @product.destroy
        redirect_to admin_products_path
    end

    private 
    def products_params
        params.require(:product).permit(:name, :description, :price_cents)
    end

end
