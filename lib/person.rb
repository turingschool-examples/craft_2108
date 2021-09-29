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
    buildable = @supplies.keys & needed
    buildable == needed
    #if the supplies needed for the craft and the supplies person has on hand match, it's buildable. Did not account for amount with might have been better. But suppllies returns empty
    #supplies is returning empty, circle back to figure out why.
  end
end
