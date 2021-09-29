class Person
  attr_reader :name,
              :interests,
              :supplies
  def initialize(person_info)
    @name      = person_info[:name]
    @interests = person_info[:interests]
    @supplies  = {}
  end

  def add_supply(supply, amount)
    @supplies[supply] = amount
    # attempting to add value amounts for like keys
    # and retain the sum as the new key/value pairin
    # within the supplies hash
    require "pry"; binding.pry
  end

  def total_supplies
    @supplies.values.sum
  end
end