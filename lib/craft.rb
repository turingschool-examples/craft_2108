class Craft
  attr_reader :name,
              :supplies
  def initialize(name, supplies)
    @name = name
    @supplies = supplies
  end
end
