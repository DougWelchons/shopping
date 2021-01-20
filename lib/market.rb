require 'time'

class Market
  attr_reader :name, :vendors, :date

  def initialize(name)
    @name = name
    @vendors = []
    @date = Date.today.strftime('%d/%m/%Y')
  end

  def add_vendor(vendor)
    @vendors << vendor
  end

  def vendor_names
    @vendors.map do |vendor|
      vendor.name
    end
  end

  def vendors_that_sell(item)
    @vendors.find_all do |vendor|
      vendor.sell?(item)
    end
  end

  def total_inventory
    @vendors.reduce({}) do |total_inventory, vendor|
      vendor.inventory.each do |item, qty|
        total_inventory[item] ||= {:quantity => 0, :vendors => []}
        total_inventory[item][:quantity] += qty
        total_inventory[item][:vendors] << vendor
      end
      total_inventory
    end
  end

  def overstocked_items
    items = total_inventory
    overstock = []
    items.each do |item, qty_and_vendors|
      if qty_and_vendors[:quantity] > 50 &&
        qty_and_vendors[:vendors].count > 1
        overstock << item
      end
    end
    overstock
  end

  def sorted_item_list
    items = total_inventory.keys
    items.map do |item|
      item.name
    end.sort
  end
end
