class Person
  attr_reader :name,
              :interests,
              :supplies

  def initialize(info)
    @name = info[:name]
    @interests = info[:interests]
    @supplies = Hash.new(0)
  end

  def add_supply(item, quantity)
    @supplies[item] += quantity
  end

  def can_build?(craft)

    craft.supplies_required.map do |supply, quantity|
      if supply[ahhh]
    end
  end

end
