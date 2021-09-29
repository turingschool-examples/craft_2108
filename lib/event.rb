class Event
  attr_reader :name,
              :crafts,
              :attendees
  def initialize(name, crafts, attendees)
    @name = name
    @crafts = crafts
    @attendees = attendees
  end

  def attendee_names
    @attendees.map do |attendee|
      attendee.name
    end
  end

  def craft_with_most_supples
    supplies = @crafts.map do |craft|
      craft.supplies_required.size
    end
    supplies
  end

  def supply_list
    supplies = @crafts.map do |craft|
      craft.supplies_required
    end
    supplies.map do |supply|
      supply.keys.join(" ").to_s
    end

  end
end