require_relative 'craft'

class Person
  attr_reader :name,
              :interests,
              :supplies

  def initialize(info)
    @name      = info[:name]
    @interests = info[:interests]
    @supplies  = Hash.new(0)
  end

  def add_supply(item, quantity)
    @supplies[item] += quantity
  end

#need to find a way where i can compare the quantities of both hash to show i have enough supplies
  def can_build?(craft)
    hash = craft.supplies_required
    supplies.keys == hash.keys && supplies.values >= hash.values
  end
end