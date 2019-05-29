class Vendor
  attr_reader :name, :inventory

  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
  end

  def stock(product, num)
    @inventory[product] += num
  end

  def check_stock(product)
    @inventory[product]
  end

end
