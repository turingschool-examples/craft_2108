class Event
  attr_reader :name,
              :crafts,
              :attendees

  def initialize(name, crafts, attendees)
    @name      = name
    @crafts    = crafts
    @attendees = attendees
  end

  def attendee_names
    @attendees.map { |person| person.name }
  end

  def craft_with_most_supplies
    @crafts.max do |craft|
      craft.supplies_required.keys.count
    end
  end

  def supply_list
    @crafts.map do |craft|
      craft.supplies_required.map do |supply, amount|
        supply.to_s
      end
    end.flatten.uniq
  end

  def attendees_by_craft_interest
    sort_by_interest = Hash.new
    @crafts.each do |craft|
      sort_by_interest[craft.name] = []
      @attendees.each do |person|
        if person.interests.include?(craft.name)
          sort_by_interest[craft.name] << person
        end
      end
    end
    sort_by_interest
  end

  def crafts_that_use(supply)
    array = []
    @crafts.each do |craft|
      craft.supplies_required.each do |sup, amount|
        if sup.to_s == supply
          array << craft
        end
      end
    end
    array
  end

  def assign_attendees_to_crafts
    assigned_attendees = Hash.new
    @crafts.each do |craft|
      assigned_attendees[craft] = []
      @attendees.each do |person|
        if person.interests.include?(craft.to_s) && person.can_build?(craft.to_s)
          assigned_attendees[craft] << person
        end
      end
    end
    assigned_attendees
  end
end
