require "docking_station"
require "bike"

describe DockingStation do
    it {is_expected.to respond_to :release_bike}

    it "releases a bike that is working" do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
      expect(bike).to be_working
    end

    it {is_expected.to respond_to(:dock).with(1).argument}

    it {is_expected.to respond_to(:bikes)}

    it "shows docked bike"  do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.bikes[0]).to eq(bike)
    end

    describe '#release_bike' do
      it 'raises an error if there is no bike' do
        expect{subject.release_bike}.to raise_error("There is no bike present")
      end
    end

    describe '#dock' do
      it 'raises an error if the docking station is full' do
        DockingStation::DEFAULT_CAPACITY.times { subject.dock(Bike.new) }
        expect{subject.dock Bike.new}.to raise_error("The docking station is full")
      end
    end

end
