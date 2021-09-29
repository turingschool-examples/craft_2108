class Event
  attr_reader :name,
              :crafts,
              :attendees

  def initialize(name, crafts, attendees)
    @name = name
    @crafts = []
    @attendees = []
  end

  def add_crafts(craft)
    @crafts << craft
  end

  def add_attendees(person)
    @attendees << person
  end
end
