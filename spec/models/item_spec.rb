require 'rails_helper'

RSpec.describe Item, type: :model do
  let(:item_without_name) { FactoryBot.build(:item) }
  let(:cone) { FactoryBot.build(:item, :cone) }
  let(:bowl) { FactoryBot.build(:item, :bowl) }
  let(:item_without_amount) { FactoryBot.build(:item, :without_amount) }

  describe 'Validates presence of' do
    context 'With Name' do
      it { expect(cone).to be_valid }
      it { expect(cone).to validate_presence_of(:name) }
      it { expect(bowl).to be_valid }
      it { expect(bowl).to validate_presence_of(:name) }
    end

    context 'Without Name' do
      it { expect(item_without_name).to_not be_valid }
    end

    context 'With Amount' do
      it { expect(cone).to be_valid }
      it { expect(cone).to validate_presence_of(:amount) }
      it { expect(bowl).to be_valid }
      it { expect(bowl).to validate_presence_of(:amount) }
    end

    context 'Without Amount' do
      it { expect(item_without_amount).to_not be_valid }
    end
  end
end
