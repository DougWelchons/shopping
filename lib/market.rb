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
end
