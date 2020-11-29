require_relative '../lib/bike.rb'
class DockingStation
 attr_reader :bike, :station

 def initialize
   @station = []
 end

  def release_bike
    if @station.empty?
      raise StandardError.new('no bikes available')
    else
      @station.shift
    end
  end

  def dock(bike)
    if @station.length >= 20
      raise StandardError.new('station is full')
    else
      @station << bike
    end
  end
end
