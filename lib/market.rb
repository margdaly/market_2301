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
    # item => {quantity=>total_inventory(of_item), 
              #vendors=> [vendors_that_sell_item]} 
              #iterate through vendors array
              #iterate through each vendors inventory hash
              #transform.values 
    total_inventory = Hash.new {|hash, key| hash[key] = {}}
    @vendors.each do |vendor|
      vendor.inventory.each do |item, amount|
        # require 'pry'; binding.pry
        total_inventory[item] = {:quantity => amount, :vendor => vendors_that_sell(item)}
      end
    end
    total_inventory
  end
  
  
  # item[:vendors] = vendors_that_sell(item)
    # require 'pry'; binding.pry

  def overstocked_items
    #An item is overstocked if it is sold by more than 1 vendor AND the total quantity is greater than 50.
  end
end
