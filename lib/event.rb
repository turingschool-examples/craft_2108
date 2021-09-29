class Event

  attr_reader       :name,
                    :craft,
                    :person

  def initialize(name, craft, person)
    @name     = name
    @craft    = []
    @person   = []
  end

  def add_craft(craft)
    @craft << craft
  end

  def add_person(name)
    @person << name
  end

  def attendee_names
    @person.map do |person_name|
      person_name.name
    end
  end

  def craft_with_most_supplies
    @craft.each do |craft|
      # I understand that my supplies_required hash is not being filled correctly
      #if it was being filled correctly, I would take the sum of all supplies
      # and return the greates
      craft.supplies_required.sum do |supply, amount|
        require "pry"; binding.pry
      end
    end
  end


end
