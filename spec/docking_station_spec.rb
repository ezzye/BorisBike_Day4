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

=begin

    describe '#set_capacity' do
      context 'capacity is provided' do
        it "set capacity to number provided" do
          expect(subject.capacity=(50)).to eq(subject.capacity)
        end
      end

      context 'capacity is not provided' do
        it "set capacity to default capacity" do
          expect(subject.capacity).to eq(20)
        end
      end
    end
=end
end
