class Admin::DashboardController < Admin::AdminController
  def show
    @total_products = Product.count
    @total_categories = Category.count
  end
end
