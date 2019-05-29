class Market
  attr_reader :name, :vendors

  def initialize(name)
    @name = name
    @vendors = []
  end

   def add_vendor(vendor)

    @vendors << vendor
  end

  def vendor_names
    @vendors.map{|vendor| vendor.name}
  end

  def vendors_that_sell(product)
    vendors_that_sell_product = []
    @vendors.find_all do |vendor|
      if vendor.inventory.include?(product)
        vendors_that_sell_product << vendor
       end
     end
  end

  def sorted_items_list
    inventory_list = []
    @vendors.each do |vendor|
      inventory_list << vendor.inventory.keys
    end
    inventory_list.flatten.uniq.sort
  end

  # def total_inventory
  #   total = Hash.new{0}
  #   @vendors.each do |vendor|
  #     total[vendor.inventory.keys] = vendor.inventory.values
  #     binding.pry
  #   end
  # end
end
