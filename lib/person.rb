class Person
  attr_reader :name,
              :interests,
              :supplies

  def initialize(person_data)
    @name = person_data[:name]
    @interests = person_data[:interests]
    @supplies = Hash.new(0)
  end

  def add_supply(supply, quantity)
    @supplies[supply] += quantity
  end

  def can_build?(craft)
    #i need to have something in the hash to compare with supplies required
    if @supplies == craft.supplies_required
      true
    else
      false
    end
  end
end