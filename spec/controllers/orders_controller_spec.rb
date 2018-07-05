require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
  let(:order) { FactoryBot.create(:order, :with_order_items) }

  describe 'Show' do
    it '/orders/:id' do
      get :show, params: { id: order.id }

      expect(response).to be_successful
      expect(response).to render_template(:show)
      expect(order.reload.status).to eq 'not_confirmed'
    end
  end

  describe 'Create' do
    context '/orders' do
      it 'Valid' do
        post :create, params: { order: FactoryBot.attributes_for(:order, :with_order_items) }

        expect(response).to have_http_status(:found)
        expect(flash[:notice]).to eq 'Order is submitted successfully'
      end

      it 'Invalid' do
        post :create, params: { order: { dummy: true } }

        expect(response).to have_http_status(:ok)
        expect(flash[:notice]).to render_template(:new)
      end
    end
  end

  describe 'Confirm Order' do
    it '/orders/confirm_order' do
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
