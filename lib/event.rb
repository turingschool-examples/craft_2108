class Event
  attr_reader :name, :crafts, :attendees

  def initialize(name, crafts, attendees)
    @name = name
    @crafts = crafts
    @attendees = attendees
  end

  def attendee_names
    attendee_name = @attendees.map do |attendee|
      attendee.name
    end
    attendee_name
  end

  def craft_with_most_supplies
    supply_craft = @crafts.max_by do |craft|
      craft.supplies_required.keys.count
    end
    supply_craft.name
  end

  def supply_list
    list = @crafts.map do |craft|
      craft.supplies_required.keys.map do |key|
        key.to_s
      end
    end.flatten!
    list.uniq
  end

  def attendees_by_craft_interest
    hash = {}

    @crafts.each do |craft|
      @attendees.map do |attendee|
        if hash[craft.name].nil?
          hash[craft.name] = []

          if attendee.interests.include?(craft.name)
            hash[craft.name] << attendee
          end
        end
      end
    end
    hash
  end
end
