class ApplicationController < ActionController::Base
    before_action :categories
    before_action :initialize_session
    helper_method :cart

    def categories
        category_names = ['Clothing', 'Furniture', 'Home & Kitchen', 'Computers', 'Beauty and Personal Care', 'Sports & Fitness']
        @categories = Category.where(name: category_names)
    end

    private

    def initialize_session
        session[:shopping_cart] ||= []
    end

    def cart
        Product.find(session[:shopping_cart])
    end
end