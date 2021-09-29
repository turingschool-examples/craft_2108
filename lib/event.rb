class Event
  attr_reader :name,
              :crafts,
              :attendees
  def initialize(name, crafts, attendees)
    @name      = name
    @crafts    = [Craft.new(name, supplies_required)]
    @attendees = [Person.new(person_info)]
    require "pry"; binding.pry
  end
end