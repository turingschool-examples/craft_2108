class Event
  attr_reader :name,
              :attendees,
              :crafts
  
  def initialize(name, crafts, attendees)
    @name = name
    @crafts = crafts
    @attendees = attendees
  end

  def craft_with_most_supplies
    high_craft = @crafts.max_by {|craft| craft.supplies_required.length}
    high_craft.name
  end

  def supply_list
    @crafts.map do |craft|
      craft.supplies_required.keys.map do |key|
        key.to_s
      end
    end.flatten.uniq
  end


  def attendees_by_craft_interest
    return_hash = Hash.new([])

    @crafts.each do |craft|
      return_hash[craft.name] = []
      
      @attendees.each do |person|
        if person.interests.include?(craft.name)
          return_hash[craft.name] << person
        end
      end
    end
    return_hash
  end

  def crafts_that_use(supply)
    @crafts.select do |craft|
      craft.supplies_required.include?(supply.to_sym)
    end
  end
end