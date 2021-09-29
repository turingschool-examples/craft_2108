class Person
  attr_reader :name,
              :interests,
              :supplies

  def initialize(person_info)
    @name = person_info[:name]
    @interests = person_info[:interests]
    @supplies = {}
  end

  def add_supply(item, number)
    supplies[item] ||= 0
    supplies[item] = supplies[item] + number
  end

  def can_build?(craft)
    able_to_build = craft.supplies_required.map do |key, value|
      if supplies[key.to_s] != nil
        value <= supplies[key.to_s]
      else
        false
      end
    end
    !able_to_build.include?(false)
  end
end
