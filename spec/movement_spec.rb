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

  describe '#move' do
    context "facing :North" do
      let(:position) { Position.new(1, 2, :North) }
      let(:new_position) { Position.new(1, 3,:North) }

      it 'returns position of y + 1' do
        expect(Movement.move(position, 1)).to eq new_position
      end
    end

    context "facing :East" do
      let(:position) { Position.new(1, 2, :East) }
      let(:new_position) { Position.new(2, 2, :East) }

      it 'returns position of x + 1' do
        expect(Movement.move(position, 1)).to eq new_position
      end
    end

    context "facing :South" do
      let(:position) { Position.new(1, 2, :South) }
      let(:new_position) { Position.new(1,1,:South) }

      it 'returns position of y - 1' do
        expect(Movement.move(position, 1)).to eq new_position
      end
    end

    context "facing :West" do
      let(:position) { Position.new(1, 2, :West) }
      let(:new_position) { Position.new(0, 2, :West) }

      it 'returns position of x - 1' do
        expect(Movement.move(position, 1)).to eq new_position
      end
    end
  end
end
