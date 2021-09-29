class Person
  attr_reader   :name,
                :interests
  attr_accessor :supplies

  def initialize(info)
    @name      = info[:name]
    @interests = info[:interests]
    @supplies  = Hash.new(0)
  end

  def add_supply(type, quantity)
    @supplies[type] += quantity
  end

end
