require 'spec_helper'
require 'movement'

describe Movement do

  describe '#valid_direction?' do
    it 'returns true if valid direction' do
      expect(Movement.valid_direction? :South).to be true
    end

    it 'returns false if invalid direction' do
      expect(Movement.valid_direction? :Southwest).to be false
    end
  end

  describe '#turn' do
    it 'returns :North if turning :right and facing :West' do
      expect(Movement.turn(:West, :right)).to eq :North
    end

    it 'returns :South if turning :left and facing :West' do
      expect(Movement.turn(:West, :left)).to eq :South
    end

    it 'returns :West if turning :left and facing :North' do
      expect(Movement.turn(:North, :left)).to eq :West
    end
  end
end
