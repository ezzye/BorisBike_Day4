require_relative "bike"

class DockingStation
  DEFAULT_CAPACITY = 20

  attr_reader :capacity

  def initialize(capacity=DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike

    raise 'There is no bike present' if empty?
    @bikes.pop
  end

  def dock(bike)
    raise 'The docking station is full' if full?
    @bikes << bike
  end

  def capacity=(capacity)
    @capacity = capacity
  end

  private

  attr_reader :bikes

  def full?
    @bikes.length >= @capacity
  end

  def empty?
    @bikes.empty?
  end

end
