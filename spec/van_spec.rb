require 'van'
require 'bike'
require 'docking_station'

describe Van do
  let(:bike) {double(:bike,:working? => false, :break => false)}
  let(:bike1) {double(:bike1,:working? => false, :break => false)}
  let(:station) {double(:station, :release_broken => [bike,bike1])}
  describe '#get' do
    # let(:station) { double("station", :broken_bike => [])}
    it 'gets broken bikes' do
      # bike.break
      # bike1.break
      # station.dock(bike)
      # station.dock(bike1)
      expect( subject.get(station.release_broken) ).to eq [bike,bike1]
    end
  end

  describe '#release_broken' do
    let(:bike) {double(:bike, :working? => false, :break => false )}
    let(:bike1) {double(:bike1, :working? => false, :break => false )}
    it 'releases all broken bikes' do
      subject.get([bike,bike1])
      expect(subject.release_broken).to eq [bike,bike1]
    end
  end
end