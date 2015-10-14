require_relative "bike"

class DockingStation
  DEFAULT_CAPACITY = 20
  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def default_capacity
    DEFAULT_CAPACITY
  end

  def release_bike

    raise 'There is no bike present' if empty?
    @bikes.pop
  end

  def dock(bike)
    raise 'The docking station is full' if full?
    @bikes << bike
  end

  private

  def full?
    @bikes.length >= DEFAULT_CAPACITY
  end

  def empty?
    @bikes.empty?
  end

end
