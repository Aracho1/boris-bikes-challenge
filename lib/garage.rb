

class Garage
  attr_reader :capacity, :broken_bikes

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @broken_bikes = []
    @working_bikes = []
  end

end