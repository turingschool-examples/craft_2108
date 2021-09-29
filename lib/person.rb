require './lib/craft'

class Person

  attr_reader :name, :interests, :supplies

  def initialize(hash)
    @name = hash[:name]
    @interests = hash[:interests]
    @supplies = {}
  end

  def add_supply(name, count)
    if @supplies.keys.include?(name) == false
      @supplies[name] = count
    else
      @supplies[name] += count
    end
  end

  def can_build?(craft)
    has_enough = true
    craft.supplies_required.each do |item, count|
      if (@supplies.keys.include?(item) == false) or (@supplies[item] < count)

        has_enough = false
      else
        has_enough = true
      end
    end
    has_enough
  end

  
end
