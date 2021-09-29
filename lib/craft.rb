class Craft
  attr_reader :name,
              :supplies_required

  def initialize(name, supplies_required)
    @name               = name
    @supplies_required  = supplies_required
  end

  def supply_count
    @supplies_required.count
  end

  def supply_names
    @supplies_required.map do |supply, _amount|
      supply.to_s
    end
  end
end
