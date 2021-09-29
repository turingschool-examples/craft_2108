class Event
  attr_reader :name,
              :crafts,
              :attendees
  def initialize(name, craft, attendee)
    @name      = name
    @crafts    = craft
    @attendees = attendee
  end

  def craft_with_most_supplies
    @crafts.max_by do |craft|
      craft.supplies.keys.count
    end.name
  end

  def supply_list
    supplies = []
    @crafts.each do |craft|
      craft.supplies.keys.each do |supply|
        supplies << supply.to_s
      end
    end
    supplies.uniq!
  end

  def attendees_by_craft_interest
    interest_hash = {}
    @crafts.each do |craft|
      interest_hash[craft.name] = @attendees.find_all do |attendee|
        attendee if attendee.interests.include?(craft.name)
      end
    end
    interest_hash
  end

  def crafts_that_use(item)
    used_by = []
    symbol_to_string = []
    @crafts.each do |craft|
      craft.supplies.keys.each do |supply|
        symbol_to_string << supply.to_s
      end
      if symbol_to_string.include?(item)
        used_by << craft
      end
      symbol_to_string.clear
    end
    used_by
  end
end
