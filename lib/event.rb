class Event
  attr_reader :name,
              :crafts,
              :attendees

  def initialize(name, craft_array, persons_array)
    @name = name
    @crafts = craft_array
    @attendees = persons_array
  end

  def attendee_names
    @attendees.map do |attendee|
      attendee.name
    end
  end

  def craft_with_the_most_supplies
    max = 0
    name = ''
    @crafts.each do |craft|
      if craft.supplies_required.keys.count > max
        max = craft.supplies_required.keys.count
        name = craft.name
      end
    end
    name
  end

  def supply_list
    supplies = []
    supply_array = []
    @crafts.each do |craft|
      supplies.push(craft.supplies_required.keys)
    end
    supplies.flatten.each do |supply|
      if supply_array.include?(supply.to_s)
        next
      else
        supply_array.push(supply.to_s)
      end
    end
    supply_array
  end

  def attendees_by_craft_interest
    craft_attendees = {}
    @crafts.each do |craft|
      craft_attendees[craft.name] = []
      @attendees.each do |attendee|
        if attendee.interests.include?(craft.name)
          craft_attendees[craft.name] += [attendee]
        end
      end
    end
    craft_attendees
  end

  def crafts_that_use(supply)
    crafts_array = []
    @crafts.each do |craft|
      craft.supplies_required.keys.each do |key|
        crafts_array.push(craft) if key.to_s == supply
      end
    end
    crafts_array
  end
end
