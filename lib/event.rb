class Event
  attr_reader :name,
              :crafts,
              :attendees


  def initialize(name, crafts, attendees)
    @name = name
    @crafts = crafts
    @attendees = []
  end

  def add_attendee(attendee)
    @attendees << attendee
  end

  def attendee_names
    @attendees.map do |attendee|
      attendee.name
    end
  end

  def craft_with_most_supplies

    @crafts.max_by do |craft|
       craft.supplies_required.keys.count
       craft.name
    end
  end

  def supply_list
    @crafts.map do |craft|
      craft.supplies_required.keys.map do |key|
        key.to_s
      end
    end.flatten.uniq
  end
end
