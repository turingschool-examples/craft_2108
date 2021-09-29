class Event
  attr_reader :name,
              :crafts,
              :attendees

  def initialize(name, crafts, attendees)
    @name       = name
    @crafts     = crafts
    @attendees  = attendees
  end

  def attendee_names
    results = []
    @attendees.each do |attendee|
      results << attendee.name
    end
    results
  end

  def craft_with_most_supplies
    @crafts.max_by do |craft|
      craft.supplies_required.keys.count
    end.name
  end

  def supply_list_helper
    results = []
    @crafts.each do |craft|
      test = craft.supplies_required.keys
      results << test
    end
    results.flatten.uniq
  end

  def supply_list
    results = []
    supply_list_helper.each do |supply|
      results << supply.to_s
    end
    results
  end
end
