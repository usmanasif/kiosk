require 'rails_helper'

RSpec.describe Order, type: :model do
  let(:order) { FactoryBot.build(:order, :with_order_items) }
  let(:order_without_order_items) { FactoryBot.build(:order) }

  describe 'Validates presence of Order Items' do
    it 'Without Order Items' do
      expect(order_without_order_items).to_not be_valid
    end

    context 'With Order Items' do
      it { expect(order).to be_valid }
      it { expect(order).to validate_presence_of(:order_items) }
      it { expect(order).to have_many(:order_items) }
      it { expect(order).to accept_nested_attributes_for(:order_items) }
    end
  end
end
