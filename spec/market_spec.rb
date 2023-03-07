require 'spec_helper'

RSpec.describe Market do
  describe '#initialize' do
    it 'exists' do
      market = Market.new('South Pearl Street Farmers Market')

      expect(market).to be_a(Market)
      expect(market.name).to eq('South Pearl Street Farmers Market')
    end

    it 'can #initialize different object' do
      market1 = Market.new('Fruit Center')

      expect(market1).to be_a(Market)
      expect(market1.name).to eq('Fruit Center')
    end
  end
end