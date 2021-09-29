class Person
  attr_reader :name,
              :interests,
              :supplies

  def initialize(info)
    @name      = info[:name]
    @interests = info[:interests]
    @supplies = Hash.new(0)
  end

  def add_supply(supply, quantity)
    @supplies[supply] += quantity
  end

  def can_build?(craft)
    enough = []
    craft.supplies_required.each do |supply, quantity|
      if @supplies[supply.to_s.gsub("_", " ")] >= quantity
        enough << true
      else
        enough << false
      end
    end
    
    if @supplies.empty?
      false
    else
      enough.all?(true)
    end
  end
end
