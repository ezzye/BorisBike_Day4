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

    it { is_expected.to respond_to(:bike)}

    it 'returns docked bikes' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.bike).to eq bike
    end

    describe '#release_bike' do
      it 'raises an error if there is no bike' do
        expect{subject.release_bike}.to raise_error("There is no bike present")
      end
    end

end
