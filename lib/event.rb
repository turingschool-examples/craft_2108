class Event
  attr_reader :name, :crafts, :attendees

  def initialize(name, crafts, attendees)
    @name = name
    @crafts = crafts
    @attendees = attendees
  end

  def attendee_names
    names = []
    @attendees.each do |attendee|
      names << attendee.name
    end
    names
  end

  def largest_name

  end
  def craft_with_most_supplies
    largest_length = 0
    largest_name = ""
    @crafts.each do |craft|
      if craft.supplies_required.length > largest_length
        largest_length = craft.supplies_required.length
      end
      if craft.supplies_required.length >= largest_length
        largest_name = craft.name
      end
    end
    largest_name
  end

  def supply_list
    array = []
    final_array = []
    @crafts.each do |craft|
      array << craft.supplies_required.keys
    end
    array = array.flatten
    array.map do |key|
      final_array << key.to_s
    end
  final_array.uniq
  end

  def attendees_by_craft_interest
    
  end
end
