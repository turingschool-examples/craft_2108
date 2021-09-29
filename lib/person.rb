class Person
  attr_reader :name,
              :interests,
              :supplies

  def initialize(info)
    @name      = info[:name]
    @interests = info[:interests]
    @supplies  = {}
  end

  def add_supply(item, quantity)
    @supplies[item] ||= quantity
    if @supplies[item] != quantity
      @supplies[item] += quantity
    end
  end
end
