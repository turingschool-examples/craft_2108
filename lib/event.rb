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
    results = []
    @attendees.each do |attendee|
      results << attendee.name
    end
    results
  end

  def craft_with_most_supplies
    @crafts.max_by do |craft|
      craft.supplies_required.keys.count
    end.name
  end

  def supply_list_helper
    results = []
    @crafts.each do |craft|
      test = craft.supplies_required.keys
      results << test
    end
    results.flatten.uniq
  end

  def supply_list
    results = []
    supply_list_helper.each do |supply|
      results << supply.to_s
    end
    results
  end

  #this returns very closely to what we want but has duplicates and doesn't return painting=>[]
  #can't figure out where to put .uniq to remove duplicates
  def attendees_by_craft_interest
    a1 = []
    results = Hash.new(a1)
    @attendees.each do |attendee|
      attendee.interests.each do |interest|
        if results[interest] == []
          results[interest] = attendee.name
        else
          results[interest] = a1 << attendee.name
        end
      end
    end
    # require "pry"; binding.pry
    results
  end

  def crafts_that_use(supply)
    results = []
    @crafts.each do |craft|
      if craft.supplies_required.keys.include?(supply.to_sym)
        results << craft
      end
    end
    results
  end
end
