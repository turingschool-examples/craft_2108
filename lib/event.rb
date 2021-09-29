class Event
  attr_reader :name,
              :attendees,
              :crafts
  
  def initialize(name, crafts, attendees)
    @name = name
    @crafts = crafts
    @attendees = attendees
  end

  def craft_with_most_supplies
    high_craft = @crafts.max_by {|craft| craft.supplies_required.length}
    high_craft.name
  end

  def supply_list
    @crafts.map do |craft|
      craft.supplies_required.keys.map do |key|
        key.to_s
      end
    end.flatten.uniq
  end
end