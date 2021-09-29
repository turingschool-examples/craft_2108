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
end