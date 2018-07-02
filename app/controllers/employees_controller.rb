class EmployeesController < ApplicationController
  def dashboard
    @orders = Order.confirmed
  end

  def complete_order
    @order = Order.find(params[:order_id])
    @order.completed!
    redirect_back fallback_location: root_path, notice: 'Order is confirmed successfully'
  end
end
