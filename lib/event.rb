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
    @attendees.map { |attendee| attendee.name }
  end

  def craft_with_most_supplies
    craft_object = @crafts.max_by { |craft| craft.supplies_required.length }
    craft_object.name
  end

  def supply_list
    symbol_list = @crafts.map do |craft|
      craft.supplies_required.keys
    end.flatten.uniq

    symbol_list.map { |symbol| symbol.to_s }
  end
end
