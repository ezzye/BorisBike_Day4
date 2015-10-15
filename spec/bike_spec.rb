require "bike"

describe Bike do
  it {is_expected.to respond_to :working?}

  describe '#set_broken' do
    it 'changes the bikes status to broken' do
      bike = Bike.new
      bike.set_broken
      expect(bike.broken).to eq true
    end
  end


end
