require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/vendor'
require 'pry'

class VendorTest < MiniTest::Test

  def setup
    @vendor = Vendor.new("Rocky Mountain Fresh")
  end

  def test_does_it_exist
    assert_instance_of Vendor, @vendor
  end

  def test_it_has_a_name
    assert_equal  "Rocky Mountain Fresh", @vendor.name
  end

  def test_inventory_is_empty
      expected = {}
      assert_equal expected, @vendor.inventory
  end

  def test_it_can_stock
    assert_equal 0, @vendor.check_stock("Peaches")

    @vendor.stock("Peaches", 30)

    assert_equal 30, @vendor.check_stock("Peaches")

     @vendor.stock("Peaches", 25)

     assert_equal 55, @vendor.check_stock("Peaches")

     @vendor.stock("Tomatoes", 12)

     expected = {"Peaches"=>55, "Tomatoes"=>12}
     assert_equal expected, @vendor.inventory
   end

end


# The Market will need to keep track of its Vendors. Each Vendor will be able to report its total inventory, stock items, and return the quantity of items. Any item not in stock should return `0` by default. Items will be represented as a String.
#
