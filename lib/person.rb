class Person
  attr_reader :name,
              :interests,
              :supplies

  def initialize(data_hash)
    @name = data_hash[:name]
    @interests = data_hash[:interests]
    @supplies = {}
  end

  def add_supply(name, quantity)
    if @supplies[name].nil?
      @supplies[name] = quantity
    else
      @supplies[name] += quantity
    end
  end

  def can_build?(craft)
    supplies_needed = 0
    craft.supplies_required.each do |supply, quantity|
      if supplies[supply.to_s].nil?
        supplies_needed += 0
      elsif supplies[supply.to_s] < quantity
        supplies_needed += 0
      elsif supplies[supply.to_s] >= quantity
        supplies_needed += 1
      end
    end
    supplies_needed == craft.supplies_required.keys.count
  end
end
