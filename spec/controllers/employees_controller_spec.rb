require 'rails_helper'

RSpec.describe EmployeesController, type: :controller do
  let(:order) { FactoryBot.create(:order, :with_order_items) }

  describe 'Dashboard' do
    it '/employees/dashboard' do
      get :dashboard

      expect(response).to be_successful
      expect(response).to render_template(:dashboard)
    end
  end

  describe 'Complete Order' do
    it '/employees/complete_order' do
      post :complete_order, params: { order_id: order.id }

      expect(response).to have_http_status(:found)
      expect(flash[:notice]).to eq 'Order is completed successfully'
      expect(order.reload.status).to eq 'completed'
    end
  end
end
