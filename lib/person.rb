class Person
  attr_reader :name,
              :interests,
              :supplies

  def initialize(attributes)
    @name       = attributes[:name]
    @interests  = attributes[:interests]
    @supplies   = Hash.new
  end

  def add_supply(name, amount)
    if @supplies[name]
      @supplies[name] += amount
    else
      @supplies[name] = amount
    end
  end

  def can_build?(craft)
    craft.supplies_required.keys.all? do |supply|
      @supplies[supply.to_s]&. >= craft.supplies_required[supply]
    end
  end
end
