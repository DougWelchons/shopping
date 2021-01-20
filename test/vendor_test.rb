require 'minitest/autorun'
require 'minitest/pride'
require './lib/vendor'
require './lib/item'

class VendorTest < Minitest::Test
  def test_it_exists_with_attributes
    vendor = Vendor.new("Rocky Mountain Fresh")
    expected = {}
    assert_instance_of Vendor, vendor
    assert_equal "Rocky Mountain Fresh", vendor.name
    assert_equal expected, vendor.inventory
  end

  def test_it_can_stock_an_item
    vendor = Vendor.new("Rocky Mountain Fresh")
    item1 = Item.new({name: 'Peach', price: "$0.75"})
    expected = {item1 => 30}
    vendor.stock(item1, 30)

    assert_equal expected, vendor.inventory
  end

  def test_it_can_check_stock
    vendor = Vendor.new("Rocky Mountain Fresh")
    item1 = Item.new({name: 'Peach', price: "$0.75"})

    assert_equal 0, vendor.check_stock(item1)

    vendor.stock(item1, 30)
    vendor.stock(item1, 25)

    assert_equal 55, vendor.check_stock(item1)
  end
end
