# frozen_string_literal: true

require_relative '../lib/bike'
require_relative '../lib/van'

# docking station class
class DockingStation
  attr_reader :bike, :bikes, :capacity
  attr_accessor :broken_bikes

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
    @broken_bikes = []
  end

  def release_bike
    raise 'No bikes available' if empty?

    @bikes.shift
  end

  def dock(bike)
    raise 'Docking station full' if full?

    if bike.broken
      broken_bikes << bike 
    else
      bikes << bike
    end
  end

  def broken?(bike)
    false if bike.working?
    true
  end

  private

  def full?
    bikes.count >= (DEFAULT_CAPACITY - broken_bikes.count)
  end

  def empty?
    bikes.empty?
  end
end
