class Person
  attr_reader :name,
              :interests,
              :supplies

  def initialize(info)
    @name      = info[:name]
    @interests = info[:interests]
    @supplies  = Hash.new(0)
  end

  def add_supply(supply, amount)
    @supplies[supply] += amount
  end

  def can_build?(craft)
    craft.supplies_required.all? do |supply, amount|
      amount <= @supplies[supply.to_s]
    end
  end
end
