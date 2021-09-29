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
end
