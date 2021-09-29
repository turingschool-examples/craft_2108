class Craft
  attr_reader :name,
              :supplies_required
  def initialize(name, supplies_required)
    @name              = name
    @supplies_required = {yarn: 20, scissors: 1, knitting_needles: 2}
    # require "pry"; binding.pry
  end
end