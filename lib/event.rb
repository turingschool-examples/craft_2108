require './lib/person'

class Event

  attr_reader :name, :crafts, :attendees

  def initialize(name, crafts, attendees)
    @name = name
    @crafts = crafts
    @attendees = attendees
  end

  def attendee_names
    names = []
    @attendees.each do |a|
      names << a.name
    end
    names
  end

  def craft_with_most_supplies
    @crafts.max_by do |craft|
      craft.supplies_required.keys.count
    end.name
  end

end
