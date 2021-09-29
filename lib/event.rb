class Event
  attr_reader :name,
              :crafts,
              :attendees

  def initialize(name, crafts, attendees)
    @name      = name
    @crafts    = crafts
    @attendees = attendees
  end

  def attendee_names
    @attendees.map do |person|
      person.name
    end
  end

  # def supply_list
  #   @crafts.map do |craft|
  #     craft.
  # end

end
