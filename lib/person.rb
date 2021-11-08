class Person
  attr_reader :name,
              :interests,
              :supplies

  def initialize(info)
    @name = info[:name]
    @interests = info[:interests]
    @supplies = Hash.new(0)
  end

  def check_supply
    @supplies
  end

  def add_supply(item, quantity)
    @supplies[item] += quantity
  end

  def can_build?(craft)
    has_enough = false
    craft.supplies_required.map do |item, count|
      if (@supplies.keys.include?(item)) && (@supplies[item] >= count)
        has_enough = true
      end
    end
    has_enough
  end
end
