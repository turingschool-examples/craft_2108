require './lib/person'
require './lib/craft'

class Event

  attr_reader :name, :crafts, :attendees

  def initialize(name, crafts, attendees)
    @name = name
    @crafts = crafts
    @attendees = attendees
  end

  def attendee_names
    names = []
    @attendees.each do |a|
      names << a.name
    end
    names
  end

  def craft_with_most_supplies
    @crafts.max_by do |craft|
      craft.supplies_required.keys.count
    end.name
  end

  def supply_list
    all_supplies = []
    @crafts.each do |craft|
      craft.supplies_required.keys.each do |key|
        all_supplies << key.to_s
      end
    end
    all_supplies.uniq
  end
end
