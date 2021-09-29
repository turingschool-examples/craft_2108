require './lib/craft'

class Person

  attr_reader :name, :interests, :supplies

  def initialize(data)
    @name = data[:name]
    @interests = data[:interests]
    @supplies = {}
  end

  def check_stock(supply)
    if @supplies.keys.none?(supply)
      0
    else
      @supplies[supply]
    end
  end

  def add_supply(supply, quantity)
    @supplies[supply] = (check_stock(supply) + (quantity))
  end

  def can_build?(craft)
    craft_supplies = []
    craft.supplies_required.keys.each do |k|
      craft_supplies << k.to_s
    end
    matching_supplies = (@supplies.each do |k,v|
      craft_supplies.find_all do |supply|
        k == supply
      end
    end)
    canbuild = false
    matching_supplies.each do |mk, mv|
      craft.supplies_required.each do |k, v|
        if k.to_s == mk && mv >= v
          canbuild = true
        end
      end
    end
    canbuild
  end
end
