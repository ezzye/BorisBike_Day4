require 'van'
require 'bike'
require 'docking_station'
require 'garage'

describe Garage do
  describe "#get" do
    let(:bike) {double(:bike,:working? => false, :break => false)}
    let(:bike1) {double(:bike1,:working? => false, :break => false)}
    let(:van) {double(:van,:release_broken => [bike,bike1])}
    it 'gets broken bikes' do
      expect( subject.get(van.release_broken) ).to eq [bike,bike1]
    end
  end
end