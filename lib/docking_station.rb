require_relative "bike"

class DockingStation
  DEFAULT_CAPACITY = 20

  attr_reader :capacity

  def initialize(capacity=DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
    @broken_count = 0
  end

  def release_bike
    raise 'There is no bike present' if empty?
    index = (@bikes.length) -1
    while true
      if index < 0
        raise 'No available working bikes'

      elsif (@bikes[index]).to_s.include?("broken")
        index -= 1
      else
        return @bikes.slice!(index)
          @bikes

      end
    end

      # if @bikes[index].to_s.include?("broken")
      #   index -= 1
      # elsif !(@bikes[index].to_s.include?("broken"))
      #   return @bikes.slice[index]
      #
      # end
  end



  def dock(bike)
    raise 'The docking station is full' if full?
    @bikes << bike
    if bike.to_s.include?("broken")
      @broken_count += 1
    end
  end

  def capacity=(capacity)
    @capacity = capacity
  end


  #private

  attr_reader :bikes

  def full?
    @bikes.length >= @capacity
  end

  def empty?
    @bikes.empty?
  end

end
