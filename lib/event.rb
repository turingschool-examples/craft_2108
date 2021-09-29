class Event
  attr_reader :name, :crafts, :attendees
  def initialize(name, crafts, attendees)
    @name = name
    @crafts = crafts
    @attendees = attendees
  end

  def attendee_names
    @attendees.map do |name|
      name.name
    end
  end

  def craft_with_most_supplies
    @crafts.max_by do |craft|
      craft.supplies_required.length
    end.name
  end

  def supply_list
    list = []
    @crafts.map do |craft|
      craft.supplies_required.each_key do |key|
      list  << key
      end
    end
    list.map {|item| item.to_s}.uniq
  end

  def attendees_by_craft_interest
    craft_interests = {}
    craft_names = @crafts.map do |craft|
      craft.name
    end

    craft_names.each do |name|
      people = @attendees.find_all do |attendee|
        attendee.interests.include?(name)
      end
      craft_interests[name] = people
    end
    craft_interests
  end

  def crafts_that_use(material)
    @crafts.find_all do |craft|
      craft.supplies_required[material.to_sym]
    end
  end
  #
  # def assign_attendees_to_crafts
  #   assigned_craft = {}
  #   assigned_craft = crafts.to_h
  #   attendees_by_craft_interest.each_key do |attendee|
  #     assigned_craft[] = attendees_by_craft_interest[attendee].shuffle.pop
  #   end
  # end
end
