require "docking_station"
require "bike"

describe DockingStation do
  let(:bike) {double(:bike)}
  let(:bike1) {double(:bike1)}
  let(:bike2) {double(:bike2)}
    it {is_expected.to respond_to :release_bike}

    it "releases a bike that is working" do

      subject.dock(bike)
      expect(subject.release_bike).to eq bike
      expect(bike).to be_working

    end

    it {is_expected.to respond_to(:dock).with(1).argument}



    it "has a default capacity" do
      expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
    end

    describe '#release_bike' do
      it 'raises an error if there is no bike' do
        expect{subject.release_bike}.to raise_error("There is no bike present")
      end
      context 'when only boken bikes' do
        it 'does not release a bike' do
          bike.break
          subject.dock(bike)
          expect{subject.release_bike}.to raise_error("There is no bike present")
        end
      end
      context 'when working and broken bikes' do
        it 'releases a working bike not the broken one' do
          bike.break
          subject.dock(bike1)
          subject.dock(bike2)
          subject.dock(bike)
          expect(subject.release_bike).to eq(bike2)
        end
      end

    end

    describe '#dock' do
      it 'raises an error if the docking station is full' do
        subject.capacity.times { subject.dock(bike) }
        expect{subject.dock(bike)}.to raise_error("The docking station is full")
      end
      it 'docks working and broken bikes' do
        bike.break
        expect(subject.dock(bike).last).to eq bike
      end
    end

    describe 'initialization' do
      subject { DockingStation.new }
      it 'defaults capacity' do
        described_class::DEFAULT_CAPACITY.times do
          subject.dock(bike)
        end
        expect{subject.dock(bike)}.to raise_error("The docking station is full")
      end
    end



end
