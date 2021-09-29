class Person
  attr_reader :name, :interests, :supplies

  def initialize(data)
    @name = data[:name]
    @interests = data[:interests]
    @supplies = {}
  end

  def add_supply(key, value)
    if @supplies[key] == nil
      @supplies[key] = value
    else
      temp_value = @supplies[key]
      temp_value += value
      @supplies[key] = temp_value
    end
  end
end
