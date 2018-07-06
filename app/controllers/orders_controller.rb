class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :confirm_order]

  def show
  end

  def new
    @order = Order.new
    @order.order_items.build
  end

  def create
    @order = Order.new(order_params)

    if @order.save
      redirect_to @order, notice: 'Order is submitted successfully'
    else
      flash[:alert] = @order.errors.full_messages.to_sentence
      render :new
    end
  end

  def confirm_order
    @order.confirmed!
    redirect_to new_order_path, notice: 'Order is confirmed successfully'
  end

  private
    def order_params
      params.fetch(:order).permit(order_items_attributes: [:_destroy, :item_id, :count_of_scoops, toppings: []])
    end

    def set_order
      @order = Order.find(params[:id])
    end
end
