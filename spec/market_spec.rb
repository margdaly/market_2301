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

  describe '#vendors' do
    before(:each) do
      @market = Market.new('South Pearl Street Farmers Market')
      @vendor1 = Vendor.new("Rocky Mountain Fresh")
      @vendor2 = Vendor.new("Ba-Nom-a-Nom")
      @vendor3 = Vendor.new("Palisade Peach Shack")
    end

    it 'starts with on vendors' do
      expect(@market.vendors).to eq([])
    end

    it 'can add a vendor' do
      @market.add_vendor(@vendor1)

      expect(@market.vendors).to eq([@vendor1])
    end

    it 'can add more vendors' do
      @market.add_vendor(@vendor1)
      @market.add_vendor(@vendor2)

      expect(@market.vendors).to eq([@vendor1, @vendor2])

      @market.add_vendor(@vendor3)
      expect(@market.vendors).to eq([@vendor1, @vendor2, @vendor3])
    end

    it "knows vendor's names" do
      @market.add_vendor(@vendor1)
      @market.add_vendor(@vendor2)
      @market.add_vendor(@vendor3)

      expect(@market.vendor_names).to eq(["Rocky Mountain Fresh", "Ba-Nom-a-Nom", "Palisade Peach Shack"])
    end
  end
end