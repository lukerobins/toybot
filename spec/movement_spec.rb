require 'spec_helper'

describe Movement do
  let(:robot) { Robot.new }

  describe '#valid_facing?' do
    it 'returns true if valid facing' do
      expect(robot.valid_facing? :South).to be true
    end

    it 'returns false if invalid facing' do
      expect(robot.valid_facing? :Southwest).to be false
    end
  end

  describe '#turn' do
    context 'facing :West'do
      before do
        robot.position = Position.new 1, 1, :West
      end

      it 'returns :North if turning :right and facing :West' do
        expect(robot.turn(:right)).to eq :North
      end

      it 'returns :South if turning :left and facing :West' do
        expect(robot.turn(:left)).to eq :South
      end
    end

    context 'facing :North'do
      before do
        robot.position = Position.new 1, 1, :North
      end

      it 'returns :East if turning :right' do
        expect(robot.turn(:right)).to eq :East
      end

      it 'returns :West if turning :left' do
        expect(robot.turn(:left)).to eq :West
      end
    end

    context 'facing :East'do
      before do
        robot.position = Position.new 1, 1, :East
      end

      it 'returns :South if turning :right' do
        expect(robot.turn(:right)).to eq :South
      end

      it 'returns :North if turning :left' do
        expect(robot.turn(:left)).to eq :North
      end
    end

    context 'facing :South'do
      before do
        robot.position = Position.new 1, 1, :South
      end

      it 'returns :West if turning :right' do
        expect(robot.turn(:right)).to eq :West
      end

      it 'returns :East if turning :left' do
        expect(robot.turn(:left)).to eq :East
      end
    end

    context 'facing :West'do
      before do
        robot.position = Position.new 1, 1, :West
      end

      it 'returns :North if turning :right and facing :West' do
        expect(robot.turn(:right)).to eq :North
      end

      it 'returns :South if turning :left and facing :West' do
        expect(robot.turn(:left)).to eq :South
      end
    end
  end

  describe '#new_positon' do
    before do
      robot.position = position
    end

    context "facing :North" do
      let(:position) { Position.new(1, 2, :North) }
      let(:expected_position) { Position.new(1, 3,:North) }

      it 'returns position of y + 1' do
        expect(robot.new_position).to eq expected_position
      end
    end

    context "facing :East" do
      let(:position) { Position.new(1, 2, :East) }
      let(:expected_position) { Position.new(2, 2, :East) }

      it 'returns position of x + 1' do
        expect(robot.new_position).to eq expected_position
      end
    end

    context "facing :South" do
      let(:position) { Position.new(1, 2, :South) }
      let(:expected_position) { Position.new(1,1,:South) }

      it 'returns position of y - 1' do
        expect(robot.new_position).to eq expected_position
      end
    end

    context "facing :West" do
      let(:position) { Position.new(1, 2, :West) }
      let(:expected_position) { Position.new(0, 2, :West) }

      it 'returns position of x - 1' do
        expect(robot.new_position).to eq expected_position
      end
    end
  end
end
