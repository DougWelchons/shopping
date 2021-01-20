require 'minitest/autorun'
require 'minitest/pride'
require './lib/item'

class ItemTest < Minitest::Test
  def test_it_exists_with_atttributes
  item = Item.new({name: 'Peach', price: "$0.75"})

    assert_instance_of Item, item
    assert_equal 'Peach', item.name
    assert_equal 0.75, item.price
  end
end
