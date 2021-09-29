class Person
  attr_reader :name, :interests, :supplies, :crafts

  def initialize(data)
    @name = data[:name]
    @interests = data[:interests]
    @supplies = Hash.new(0)
    @crafts = []
  end

  def add_supply(item, quantity)
    if @supplies[item].nil?
      @supplies[item] = quantity
    else
      @supplies[item] += quantity
    end
  end

  def add_craft(craft)
    @crafts << craft
  end

  def can_build?(craft_obj)
    builder = @crafts.map do |craft_obj|
      (@supplies.keys.include?(craft_obj.supplies_required.keys)) &&
      (@supplies.values.each do |supply|
        craft_obj.supplies_required.keys.each do |key|
          supply >= key
        end
      end)
    end
    builder.pop
  end
end
