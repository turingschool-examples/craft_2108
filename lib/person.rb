class Person
  attr_reader :name,
              :interests,
              :supplies

  def initialize(info)
    @name = info[:name]
    @interests = info[:interests]
    @supplies = Hash.new(0)
  end

  def add_supply(supply, quantity)
    @supplies[supply] += quantity
  end

  def can_build?(craft)
    flag = true

    craft.supplies_required.each do | supply, quantity |
      if @supplies[supply.to_s] < quantity
        flag = false
      end
    end
    flag
  end
end