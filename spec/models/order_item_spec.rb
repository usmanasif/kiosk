require 'rails_helper'

RSpec.describe Order, type: :model do
  let(:order) { FactoryBot.create(:order, :with_order_items) }
  let(:order_item_without_order) { FactoryBot.build(:order_item) }
  let(:order_item) { order.order_items.first }

  describe 'Validates presence of Order' do
    it 'Without Order' do
      expect(order_item_without_order).to_not be_valid
    end

    context 'With Order' do
      it { expect(order_item).to be_valid }
      it { expect(order_item).to belong_to(:order) }
    end
  end

  describe 'Validates presence of Product name' do
    it 'Without Product Name' do
      order_item.product_name = nil
      expect(order_item).to_not be_valid
    end

    context 'With Product Name' do
      it { expect(order_item).to be_valid }
      it { expect(order_item).to validate_presence_of(:product_name) }
    end
  end

  describe 'Validates presence of Count of Scoops' do
    it 'Without Count of Scoops' do
      order_item.count_of_scoops = nil
      expect(order_item).to_not be_valid
    end

    context 'With Count of Scoops' do
      it { expect(order_item).to be_valid }
      it { expect(order_item).to validate_presence_of(:count_of_scoops) }
    end
  end

  describe 'Check Count of Scoops' do
    context 'Cone' do
      it 'Invalid' do
        order_item.count_of_scoops = 3
        expect(order_item).to_not be_valid
      end

      it 'Invalid' do
        order_item.count_of_scoops = 2
        expect(order_item).to be_valid
      end
    end

    context 'Bowl' do
      before do
        order_item.product_name = 'Bowl'
      end

      it 'Invalid' do
        order_item.count_of_scoops = 4
        expect(order_item).to_not be_valid
      end

      it 'Invalid' do
        order_item.count_of_scoops = 3
        expect(order_item).to be_valid
      end
    end
  end

  describe 'Check Count of Toppings' do
    context 'Cone' do
      it 'Invalid' do
        order_item.toppings = ['Almonds', 'Caramel']
        expect(order_item).to_not be_valid
      end

      it 'Invalid' do
        order_item.toppings = ['Almonds']
        expect(order_item).to be_valid
      end
    end

    context 'Bowl' do
      before do
        order_item.product_name = 'Bowl'
      end

      it 'Invalid' do
        order_item.toppings = ['Almonds', 'Caramel', 'Chocolate Chips']
        expect(order_item).to_not be_valid
      end

      it 'Invalid' do
        order_item.toppings = ['Almonds', 'Caramel']
        expect(order_item).to be_valid
      end
    end
  end
end
