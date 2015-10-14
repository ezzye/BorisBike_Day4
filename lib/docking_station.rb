require_relative "bike"

class DockingStation

  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def release_bike

    raise 'There is no bike present' unless @bikes.length >= 1
    @bikes.pop
  end

  def dock(bike)
    raise 'The docking station is full' if @bikes.length >= 20
    @bikes << bike
  end

end
