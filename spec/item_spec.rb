require 'spec_helper'

RSpec.describe Item do
  describe '#initialize' do
    it 'exists' do
      item1 = Item.new({name: 'Peach', price: "$0.75"})

      expect(item1).to be_a(Item)
      expect(item1.name).to eq('Peach')
      expect(item1.price).to eq(0.75)
    end

    it 'can #initialize different object' do
      item2 = Item.new({name: 'Tomato', price: '$0.50'})

      expect(item2).to be_a(Item)
      expect(item2.name).to eq('Tomato')
      expect(item2.price).to eq(0.5)
    end
  end
end