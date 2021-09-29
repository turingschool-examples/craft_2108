class Event
  attr_reader :name,
              :crafts,
              :attendees

  def initialize(name, crafts, attendees)
    @name      = name
    @crafts    = crafts[0]
    @attendees = attendees[0]
  end

  def add_attendee(name)
    @attendees.push(name)
  end
end
