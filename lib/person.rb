class Person
  attr_reader :supplies,
              :name,
              :interests

  def initialize(data)
    @name = data[:name]
    @interests = data[:interests]
    @supplies = {}
  end

  def supplies
    @supplies
  end

end




