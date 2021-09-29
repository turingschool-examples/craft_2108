class Person
  attr_reader :name,
              :interests,
              :supplies
  def initialize(info)
    @name = info[:name]
    @interests = info[:interests]
    @supplies = {}
  end

  def add_supply(supply, amount)
  #line 13 took me sooo long to work out >_<
    @supplies.store(supply, amount)
  #I spent most of the time with this one
    supplies_added = {}
    require "pry"; binding.pry
      @supplies.each do |added|
        added.each do |supply, amount|
         supplies_added[supply] ||= 0
          supplies_added[supply] += amount
       end
     end
    supplies_added
  end
end
