require_relative "bike"

class DockingStation
  DEFAULT_CAPACITY = 20

  attr_reader :capacity

  def initialize(capacity=DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
    @broken_bikes = []
  end

  def release_bike
    raise 'There is no bike present' if empty?
    @bikes.pop
  end

  def release_broken
    @broken_bikes
  end


  def dock(bike)
    raise 'The docking station is full' if full?
    bike.working? ? @bikes << bike : @broken_bikes << bike
    # return @bikes << bike if bike.working?
    # @broken_bikes << bike if !(bike.working?)
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
