class Event
  attr_reader :name,
              :crafts,
              :attendees

  def initialize(name, craft, person)
    @name = name
    @crafts = craft
    @attendees = person
  end

  def attendee_names
    @attendees.map do |attendee|
      attendee.name
    end
  end

  def craft_with_most_supplies
    @crafts.max_by do |craft|
      craft.supplies_required.length
    end.name
  end

  def supply_list
    keys_array = @crafts.map do |craft|
      craft.supplies_required.keys
    end.flatten
    keys_array.map do |key|
      key.to_s
    end.uniq
  end

  def attendees_by_craft_interest
    interest_hash = Hash.new
    @crafts.each do |craft|
      interest_hash[craft.name] = []
    end

    interest_hash.each do |interest_key, attendee_array|
      @attendees.each do |attendee|
        attendee.interests.each do |interest|
          if interest == interest_key
            interest_hash[interest_key] << attendee
          end
        end
      end
    end
  interest_hash
  end

  def crafts_that_use(supply)
    @crafts.map do |craft|
      if craft.supplies_required.keys.include?(supply.to_sym)
        craft
      end
    end.compact
  end

  def assign_attendees_to_crafts
    interested_and_can_build = Hash.new
    @crafts.each do |craft|
      hash[craft] = []
    end

    @crafts.each do |craft|
      @attendees.each do |attendee|
        if attendee.can_build?(craft) && attendee.interests.include?(craft.name)
          interested_and_can_build[craft] << attendee
        end
      end
    end
    interested_and_can_build
  end
end
