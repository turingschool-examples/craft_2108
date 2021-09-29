class Person
  attr_reader :name, :interests, :supplies
  def initialize(data)
    @name = data[:name]
    @interests = data[:interests]
    @supplies = Hash.new(0)
  end
  def add_supply(name, amount)
    @supplies[name] += amount
  end
  def can_build?(craft)
    boolean_array = []
    craft.supplies_required.each_key do |key|
      boolean_array << (craft.supplies_required[key] <= @supplies[(key.to_s)])
    end
    boolean_array.all?
  end
end
