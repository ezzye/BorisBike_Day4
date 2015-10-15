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


=begin
    it {is_expected.to respond_to(subject.bikes)}

    it "shows docked bike"  do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.bikes[0]).to eq(bike)
    end
=end

    it "has a default capacity" do
      expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
    end

    describe '#release_bike' do
      it 'raises an error if there is no bike' do
        expect{subject.release_bike}.to raise_error("There is no bike present")
      end

      it 'does not release a bike if it is broken' do
        bike = Bike.new
        bike.set_broken
        subject.dock(Bike.new)
        subject.dock(bike)
        subject.dock(Bike.new)
        2.times { subject.release_bike }
        expect{subject.release_bike}.to raise_error("No available working bikes")
      end
    end

    describe '#dock' do
      it 'raises an error if the docking station is full' do
        subject.capacity.times { subject.dock(Bike.new) }
        expect{subject.dock Bike.new}.to raise_error("The docking station is full")
      end


    end

    describe 'initialization' do
      subject { DockingStation.new }
      let(:bike) {Bike.new}
      it 'defaults capacity' do
        described_class::DEFAULT_CAPACITY.times do
          subject.dock(bike)
        end
        expect{subject.dock(bike)}.to raise_error("The docking station is full")
      end
    end


end
