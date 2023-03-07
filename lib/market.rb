class Market
  attr_reader :name,
              :vendors
   
  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vendor(vendor)
    @vendors << vendor
  end

  def vendor_names
    vendor_names = []
    @vendors.each do |vendor|
      vendor_names << vendor.name
    end
    vendor_names
  end

  def vendors_that_sell(item)
    @vendors.select do |vendor|
      vendor.inventory.has_key?(item)
    end
  end

  def sorted_item_list
    sorted_item_list = []
    @vendors.each do |vendor|
      vendor.inventory.each do |item, _|
        sorted_item_list << item.name
      end
    end
    sorted_item_list.sort!
    sorted_item_list.uniq.join(', ')
  end

  def total_inventory
    #return a hash with items as keys and hash as values - this sub-hash should have two key/value pairs: quantity pointing to total inventory for that item and vendors pointing to an array of the vendors that sell that item.
  end
end
