class Event
  attr_reader :name,
              :crafts,
              :attendees

  def initialize(name, crafts, attendees)
    @name = name
    @crafts = crafts
    @attendees = attendees
    @attendee_hash = {}
  end

  def attendee_names
    @attendees.map do |attendee|
      attendee.name
    end
  end

  def craft_with_most_supplies
    @crafts.max_by do |craft|
      craft.supply_count
    end.name
  end

  def supply_list
    @crafts.flat_map do |craft|
      craft.supply_names
    end.uniq
  end

  def craft_hash
    @crafts.each do |craft|
      @attendee_hash[craft.name] = []
    end
    @attendee_hash
  end

  def attendees_by_craft_interest
    craft_hash
    @attendees.each do |attendee|
      attendee.interests.each do |interest|
        unless @attendee_hash[interest].nil?
          @attendee_hash[interest] << attendee
        end
      end
    end
    @attendee_hash
  end

  def crafts_that_use(supply)
    @crafts.filter_map do |craft|
      craft if craft.supplies_required.keys.join.include?(supply)
    end
  end
end
