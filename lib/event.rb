class Event
  attr_reader :name,
              :crafts,
              :attendees

  def initialize(name, crafts, attendees)
    @name = name
    @crafts = crafts
    @attendees = attendees
  end

  def craft_with_most_supplies
    max_craft = @crafts.max_by { |craft| craft.supplies_required.length }
    max_craft.name
  end

  def supply_list
    supply_list = []
    @crafts.each do |craft|
      craft.materials_required.each do |material|
        supply_list << material.to_s
      end
    end
    supply_list.uniq
  end

  def attendees_by_craft_interest
    crafts_and_attendees = {}
    crafts.each do |craft|
      crafts_and_attendees[craft.name] ||= []
      attendees.each do |attendee|
        if attendee.interests.include?(craft.name)
          crafts_and_attendees[craft.name] << attendee
        end
      end
    end
    crafts_and_attendees
  end

  def crafts_that_use(material)
    @crafts.find_all do |craft|
      craft.materials_required.include?(material.to_sym)
    end
  end

  def assign_attendees_to_crafts
    craft_attendee_hash = {}
    crafts.each do |craft|
      craft_attendee_hash[craft] = []
    end
    attendees.each do |attendee|
      shuffled_interests = attendee.interests.shuffle
      shuffled_interests.each do |interest|
        chosen_craft = crafts.find do |craft|
          craft.name == interest
        end
        if !chosen_craft.nil? && attendee.can_build?(chosen_craft)
          craft_attendee_hash[chosen_craft] << attendee
        end
        if craft_attendee_hash.values.flatten.include?(attendee)
          break
        end
      end
    end
    craft_attendee_hash
  end
end
