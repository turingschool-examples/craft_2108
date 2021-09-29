class Event
  attr_reader :name,
              :crafts,
              :attendees

  def initialize(name, crafts, attendees)
    @name = name
    @crafts = crafts
    @attendees = attendees
  end

  def attendee_names
    names_array = []
    @attendees.each do |attendee|
      names_array << attendee.name
    end
    names_array
  end

  def craft_with_most_supplies
    craft_info = @crafts.max_by do  |craft|
      craft.supplies_required.length
    end
    craft_info.name
  end

  def supply_list
    supply_array = []
    @crafts.each do |craft|
      craft.supplies_required.keys.each do |k|
        supply_array << k.to_s
      end
  end
  #i need to not have the painting supply list, i need to fix something in my test
  supply_array.flatten.uniq
  end

  def attendees_by_craft_interest
    craft_hash = {}
      @crafts.each do |craft|
        if craft_hash[craft.name].nil?
          craft_hash[craft.name] = []
        end
          @attendees.each do |person|
            if person.interests.include?(craft.name)
              craft_hash[craft.name] << person
            end
          end
    end
    craft_hash
  end

  def crafts_that_use(item)
    @crafts.select do |craft|
      require "pry"; binding.pry
      craft.supplies_required #need to include? item 
    end
  end
end