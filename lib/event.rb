class Event
  attr_reader :name,
              :attendees,
              :crafts
  
  def initialize(name, crafts, attendees)
    @name = name
    @crafts = crafts
    @attendees = attendees
  end
end