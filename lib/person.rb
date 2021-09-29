class Person

  attr_reader :name, :interests, :supplies

  def initialize(data)
    @name = data[:name]
    @interests = data[:interests]
    @supplies = {}
  end

  def check_stock(supply)
    if @supplies.keys.none?(supply)
      0
    else
      @supplies[supply]
    end
  end

  def add_supply(supply, quantity)
    @supplies[supply] = (check_stock(supply) + (quantity))
  end
end
