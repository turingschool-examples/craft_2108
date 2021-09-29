require './lib/person'
require './lib/craft'

class Event

  attr_reader :name, :crafts, :attendees

  def initialize (name, crafts, attendees)
    @name = name
    @crafts = crafts
    @attendees = attendees
  end

  def attendee_names
    attendee_name_array = []
    @attendees.each do |attendee|
      attendee_name_array << attendee.name
    end
    attendee_name_array
  end

  def craft_with_most_supplies
    greedy_craft = @crafts.max_by do |craft|
      craft.supplies_required.length
    end
    greedy_craft.name
  end

  def supply_list
    supply_list_unsorted = []
    @crafts.each do |craft|
      supply_list_unsorted << craft.supplies_required.keys
    end
    supply_list_sorted = supply_list_unsorted.flatten.uniq
    supply_list_sorted.map do |symbol|
      symbol.to_s
    end
  end

  def attendees_by_craft_interest
    hash = Hash.new
    @crafts.each do |craft|
      if hash.keys.include?(craft.name) == false
        hash[craft.name] = []
      end

      @attendees.each do |person|
        if person.interests.include?(craft.name)
          hash[craft.name] << person
        end
      end
    end
    hash
  end
end
