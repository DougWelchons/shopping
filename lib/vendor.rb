class Vendor
  attr_reader :name, :inventory

  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
  end

  def stock(item, qty)
    @inventory[item] += qty
  end

  def check_stock(item)
    @inventory[item]
  end

  def sell?(item)
    @inventory[item] > 0
  end

  def potential_revenue
    revenue = 0.0
    @inventory.each do |item, qty|
      revenue += item.price * qty
    end
    revenue
  end
end
