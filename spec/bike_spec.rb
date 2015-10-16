require "bike"

describe Bike do
  let(:bike) {Bike.new}

  it {is_expected.to respond_to :working?}


  describe 'initialize' do
    it "creates a working bike" do
      expect(bike).to be_working
    end
  end

  describe '#break' do
    it 'breaks the bike' do
      bike.break
      expect(bike).not_to be_working
    end
  end
end
