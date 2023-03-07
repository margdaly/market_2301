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
end