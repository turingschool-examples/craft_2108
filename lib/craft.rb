class Craft
  attr_reader :name,
              :supplies_required
  def initialize(name,info)
    @name = name
    @supplies_required = info[:supplies_required]
  end
end
