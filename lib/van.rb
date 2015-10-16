require './lib/docking_station'

class Van

  def get broken_bikes
    @broken_bikes = broken_bikes
  end

  def release_broken
    @broken_bikes
  end

end