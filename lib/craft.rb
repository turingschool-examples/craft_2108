class Craft
  attr_reader :name,
              :supplies_required
  def initialize(name, supplies_hash)
    @name = name
    @supplies_required = supplies_hash
  end
end
