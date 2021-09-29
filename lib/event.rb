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

  def attendees_by_craft_interest
    result = {}

    @crafts.each do |craft|
      interested_attendees = @attendees.find_all do |attendee|
        attendee.interests.include?(craft.name)
      end

      result[craft.name] = interested_attendees
    end

    result
  end

  def crafts_that_use(supply_name)
    supply_name = supply_name.to_sym

    @crafts.find_all do |craft|
      craft.supplies_required.include?(supply_name)
    end
  end
end
