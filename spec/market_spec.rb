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
      expect(@market.vendor_names).to eq(["Rocky Mountain Fresh"])

      @market.add_vendor(@vendor2)
      @market.add_vendor(@vendor3)
      expect(@market.vendor_names).to eq(["Rocky Mountain Fresh", "Ba-Nom-a-Nom", "Palisade Peach Shack"])
    end
  end

  describe '#vendors_that_sell' do
    before(:each) do
      @market = Market.new('South Pearl Street Farmers Market')
      @vendor1 = Vendor.new("Rocky Mountain Fresh")
      @vendor2 = Vendor.new("Ba-Nom-a-Nom")
      @vendor3 = Vendor.new("Palisade Peach Shack")
      @item1 = Item.new({name: 'Peach', price: "$0.75"})
      @item2 = Item.new({name: 'Tomato', price: "$0.50"})
      @item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
      @item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})

      @vendor1.stock(@item1, 35)
      @vendor1.stock(@item2, 7)

      @vendor2.stock(@item3, 25)
      @vendor2.stock(@item4, 50)

      @vendor3.stock(@item1, 65)

      @market.add_vendor(@vendor1)
      @market.add_vendor(@vendor2)
      @market.add_vendor(@vendor3)
    end

    it 'can list which vendors sell specific item' do
      expect(@market.vendors_that_sell(@item1)).to eq([@vendor1, @vendor3])
      expect(@market.vendors_that_sell(@item4)).to eq([@vendor2])
      expect(@market.vendors_that_sell(@item5)).to eq([])
    end
  end

  describe '#iteration 3' do
    before(:each) do
      @market = Market.new('South Pearl Street Farmers Market')
      @vendor1 = Vendor.new("Rocky Mountain Fresh")
      @vendor2 = Vendor.new("Ba-Nom-a-Nom")
      @vendor3 = Vendor.new("Palisade Peach Shack")
      @item1 = Item.new({name: 'Peach', price: "$0.75"})
      @item2 = Item.new({name: 'Tomato', price: "$0.50"})
      @item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
      @item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})

      @vendor1.stock(@item1, 35)
      @vendor1.stock(@item2, 7)

      @vendor2.stock(@item3, 25)
      @vendor2.stock(@item4, 50)

      @vendor3.stock(@item1, 65)

      @market.add_vendor(@vendor1)
      @market.add_vendor(@vendor2)
      # @market.add_vendor(@vendor3)
    end

    it '#sorted_item_list' do
      expect(@market.sorted_item_list).to eq('Banana Nice Cream, Peach, Peach-Raspberry Nice Cream, Tomato')

      @market.add_vendor(@vendor3)
      expect(@market.sorted_item_list).to eq('Banana Nice Cream, Peach, Peach-Raspberry Nice Cream, Tomato')
    end

    it '#total_inventory' do
      expect(@market.total_inventory).to eq({
        @item1=>{quantity=>35, vendors=>[@vendor1]}, @item2=>{quantity=>7, vendors=>[@vendor1]}
        @item3=>{quantity=>25, vendors=>[@vendor2]}
        @item4=>{quantity=>50, vendors=>[@vendor2]}
      })

      @market.add_vendor(@vendor3)
      expect(@market.total_inventory).to eq({
        @item1=>{quantity=>100, vendors=>[@vendor1, @vendor3]}, 
        @item2=>{quantity=>7, vendors=>[@vendor1]}
        @item3=>{quantity=>25, vendors=>[@vendor2]}
        @item4=>{quantity=>50, vendors=>[@vendor2]}
      })
    end
  end
end