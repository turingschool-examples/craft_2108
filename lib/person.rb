class Person
  attr_reader :name,
              :interests,
              :supplies

  def initialize(info)
    @name       = info[:name]
    @interests  = info[:interests]
    @supplies   = Hash.new(0)
  end

  def add_supply(name, amount)
    @supplies[name] += amount
  end

  def can_build_helper
    results = []
    @supplies.keys.each do |key|
      results << key.to_sym
    end
    results
  end

  #this does not work...
  def can_build?(craft)
    if @supplies == {}
      false
    else
      #ideally compare values of craft.supplies_required to values of @supplies and retrun if @supplies.values >= craft.supplies_required.values
    end
  end
end
