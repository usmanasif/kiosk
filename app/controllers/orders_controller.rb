class OrdersController < ApplicationController
  def show
  end

  def new
    @order = Order.new
    @order.order_items.build
  end

  def create
    order = Order.new(order_params)

    if order.save
      flash[:notice] = 'Order is submitted successfully'
      redirect_to order
    else
      render :new
    end
  end

  private
    def order_params
      params.fetch(:order).permit(order_items_attributes: [:product_name, :count_of_scoops, toppings: []])
    end
end
