class Event
  attr_reader :name,
              :crafts,
              :attendees

  def initialize(name, crafts, attendees)
    @name = name
    @crafts = crafts
    @attendees = attendees
  end

  def craft_with_most_supplies
    max_craft = @crafts.max_by { |craft| craft.supplies_required.length }
    max_craft.name
  end

  def supply_list
    supply_list = []
    @crafts.each do |craft|
      craft.supplies_required.each do |material, count|
        supply_list << material.to_s
      end
    end
    supply_list.uniq
  end
end
