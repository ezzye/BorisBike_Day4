require 'docking_station'
require 'van'
require 'garage'

shared_examples_for "a bike container" do
  let(:bike_container) {described_class.new}
  let(:broken_bikes) {double(:broken_bikes)}

  describe '#get' do
    it 'gets broken bikes' do
      expect(bike_container.get(broken_bikes)).to eq broken_bikes
    end
  end
  describe '#release_broken' do
    it 'releases broken bikes' do
      bike_container.get(broken_bikes)
      expect( bike_container.release_broken).to eq broken_bikes
    end
  end
end

describe Garage do
  it_behaves_like "a bike container"
end

describe Van do
  it_behaves_like "a bike container"
end