require "docking_station"
require "bike"

describe DockingStation do
  # let(:bike) {double(:bike)}

    it {is_expected.to respond_to :release_bike}

    let(:bike) {double("bike", :working? => true)}

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
      let(:bike) {double("bike", :working? => false, :break => false)}
      it 'raises an error if there is no bike' do
        expect{subject.release_bike}.to raise_error("There is no bike present")
      end
      context 'when only boken bikes' do
        it 'does not release a bike' do
          # allow(bike).to receive(:break).and_return(false)
          # allow(bike).to receive(:working?).and_return(false)
          bike.break
          subject.dock(bike)
          expect{subject.release_bike}.to raise_error("There is no bike present")
        end
      end
      context 'when working and broken bikes' do
          let(:bike1) {double("bike1", :working? => true)}
          let(:bike2) {double("bike2", :working? => true)}
        it 'releases a working bike not the broken one' do
          # allow(bike).to receive(:break).and_return(false)
          # allow(bike1).to receive(:working?).and_return(true)
          # allow(bike2).to receive(:working?).and_return(true)
          # allow(bike).to receive(:working?).and_return(false)
          bike.break
          subject.dock(bike1)
          subject.dock(bike2)
          subject.dock(bike)
          expect(subject.release_bike).to eq(bike2)
        end
      end

    end

    describe '#dock' do
      context 'when docking station full' do
        let(:bike) {double("bike", :working? => true)}
        it 'raises an error if the docking station is full' do
          # allow(bike).to receive(:working?).and_return(true)
          subject.capacity.times { subject.dock(bike) }
          expect{subject.dock(bike)}.to raise_error("The docking station is full")
        end
      end
      context' when trying to dock bikes' do
        let(:bike) {double("bike", :working? => false, :break => false)}
        it 'docks working and broken bikes' do
          # allow(bike).to receive(:break).and_return(false)
         # allow(bike).to receive(:working?).and_return(false)
          bike.break
         expect(subject.dock(bike).last).to eq bike
        end
      end
    end

    describe 'initialization' do
      subject { DockingStation.new }
      it 'defaults capacity' do
        described_class::DEFAULT_CAPACITY.times do
          allow(bike).to receive(:working?).and_return(true)
          subject.dock(bike)
        end
        expect{subject.dock(bike)}.to raise_error("The docking station is full")
      end
    end



end
