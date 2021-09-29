class Person
  attr_reader :name,
              :interests,
              :supplies

  def initialize(info)
    @name = info[:name]
    @interests = info[:interests]
    @supplies = Hash.new
  end

  def add_supply(name, amount)
    @supplies[name] = amount
  end

  def can_build?(craft)
    if @supplies != {}
      True
    end
  end
end