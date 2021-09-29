class Person
  attr_reader :name,
              :interests,
              :supplies

  def initialize(attributes)
    @name      = attributes[:name]
    @interests = attributes[:interests]
    @supplies  = Hash.new(0)
  end

  def add_supply(item, quantity)
    @supplies[item] += quantity
  end

  def can_build?(craft)
    needed = []
    craft.supplies.keys.each do |supply|
      needed << supply.to_s
    end
    @supplies.keys == needed
    #supplies is returning empty, circle back to figure out why.
  end
end
