class Event
  attr_reader :name,
              :crafts,
              :attendees

  def initialize(name, crafts, attendees)
    @name   = name
    @crafts  = crafts
    @attendees = attendees
  end

  def attendee_names
    attendees.map do |attendee|
      attendee.name
    end
  end

  def craft_with_most_supplies
    most = crafts.max_by do |craft|
      craft.supplies_required.count
    end
    most.name
  end

  def supply_list
    all = []
    item_sym = crafts.flat_map do |craft|
      craft.supplies_required.keys
    end.uniq
    item_sym.each do |item|
      all << item.to_s
    end
    all
  end
end