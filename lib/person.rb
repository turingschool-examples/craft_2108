class Person
  attr_reader   :name,
                :interests
  attr_accessor :supplies

  def initialize(info)
    @name      = info[:name]
    @interests = info[:interests]
    @supplies  = {}
  end

  def add_supply(type, number_supplied)
    @supplies[type] = number_supplied
    #spent too long trying to figure this out and just went ahead
  end

end
