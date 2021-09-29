class Craft

  attr_reader   :name,
                :supplies_required

  def initialize(name, supplies_required)
    @name                 = name
    @supplies_required    = Hash.new(0)

  end

  def add_supply(name, amount)
    if @supplies_required[name].nil?
      @supplies_required[name] = amount
    else supplies_required[name] += amount
    end
    @supplies_required
  end

end
