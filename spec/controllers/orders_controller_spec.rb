require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
  describe 'Show' do
    it '/orders/:id' do
      order = Order.new
      order_item = OrderItem.new(product_name: 'Cone', count_of_scoops: 1, toppings: ['Almonds'])
      order.order_items << order_item
      order.save

      get :show, params: { id: order.id }

      expect(response).to be_successful
      expect(response).to render_template(:show)
      expect(order.reload.status).to eq 'not_confirmed'
    end
  end

  describe 'Confirm Order' do
    it '/orders/confirm_order' do
      order = Order.new
      order_item = OrderItem.new(product_name: 'Cone', count_of_scoops: 1, toppings: ['Almonds'])
      order.order_items << order_item
      order.save

      post :confirm_order, params: { id: order.id }

      expect(response).to have_http_status(:found)
      expect(flash[:notice]).to eq 'Order is confirmed successfully'
      expect(order.reload.status).to eq 'confirmed'
    end
  end

  describe 'New' do
    it '/orders/new' do
      get :new

      expect(response).to be_successful
      expect(response).to render_template(:new)
      expect(assigns(:order)).to be_a_new(Order)
    end
  end
end
