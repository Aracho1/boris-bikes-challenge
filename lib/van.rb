require_relative '../lib/dockingstation'
require_relative '../lib/garage'

class Van
  attr_reader :garage, :capacity
  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @garage = Garage.new
  end

  def collect(station)
    station.broken_bikes.each{ |bike| garage.broken_bikes << station.broken_bikes.delete(bike) }
  end
end