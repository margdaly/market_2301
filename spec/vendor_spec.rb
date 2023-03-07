require 'spec_helper'

RSpec.describe Vendor do
  describe '#initialize' do
    it 'exists' do
      vendor = Vendor.new('Rocky Mountain Fresh')

      expect(vendor).to be_a(Vendor)
      expect(vendor.name).to eq('Rocky Mountain Fresh')
      expect(vendor.inventory).to eq({})
    end

    it 'can #initialize different object' do
      vendor1 = Vendor.new('Traders')

      expect(vendor1).to be_a(Vendor)
      expect(vendor1.name).to eq('Traders')
      expect(vendor1.inventory).to eq({})
    end
  end

  describe '#check_stock' do
    before(:each) do
      @vendor = Vendor.new('Rocky Mountain Fresh')
      @item1 = Item.new({name: 'Peach', price: "$0.75"})
      @item2 = Item.new({name: 'Tomato', price: '$0.50'})
    end

    it 'starts with no inventory' do
      expect(@vendor.check_stock(@item1)).to eq(0)
    end

    it 'can add stock' do
      @vendor.stock(@item1, 30)

      expect(@vendor.inventory).to eq({@item1 => 30})
    end

    it 'can check stock' do
      @vendor.stock(@item1, 30)

      expect(@vendor.check_stock(@item1)).to eq(30)
    end

    it 'can add more stock and check' do
      @vendor.stock(@item1, 30)
      @vendor.stock(@item1, 25)

      expect(@vendor.check_stock(@item1)).to eq(55)

      @vendor.stock(@item2, 12)
      expect(@vendor.inventory).to eq({@item1 => 55, @item2 => 12})
    end
  end
end